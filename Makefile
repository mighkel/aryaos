# AryaOS Makefile
#
# Copyright Sensors & Signals LLC https://www.snstac.com/
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#


sync:
	rsync -va ../aryaos beast.local:~/work/SNS/

mkdocs:
	pip install -r docs/requirements.txt
	mkdocs serve

aryaaio:
	ansible-playbook -i inventory.yml -e '@secret' site.yml -l aryaaio

check:
	ansible-playbook -i inventory.yml -e '@secret' site.yml -l aryaaio --check


build: pi-gen
	sudo ./build.sh

pi-gen:
	git clone --branch arm64 https://github.com/RPI-Distro/pi-gen.git
	touch ./pi-gen/stage2/SKIP_IMAGES ./pi-gen/stage2/SKIP_NOOBS

skip:
	touch pi-gen/stage0/SKIP
	touch pi-gen/stage1/SKIP
	touch pi-gen/stage2/SKIP

unskip:
	rm -f */SKIP
	rm -f pi-gen/*/SKIP

copyback:
	scp gba@beast.local:~/work/SNS/aryaos/pi-gen/deploy/image*.zip .

skip3:
	touch stage3*/SKIP

skip4:
	touch stage4*/SKIP

skip5:
	touch stage5*/SKIP

debauto:
	ansible-playbook -i inventory.yml -e '@secret' site.yml -l debauto

imxtak:
	ansible-playbook -i inventory.yml -e '@secret' site.yml -l imxtak
