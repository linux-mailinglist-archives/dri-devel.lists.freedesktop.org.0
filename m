Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7F986614
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 17:41:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AB8B6E882;
	Thu,  8 Aug 2019 15:41:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6C2D06E882
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Aug 2019 15:41:26 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6389D72167; Thu,  8 Aug 2019 15:41:26 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111333] [drm:radeon_atom_pick_dig_encoder [radeon]] *ERROR*
 chosen encoder in use 0
Date: Thu, 08 Aug 2019 15:41:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t50@interia.pl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111333-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0524657406=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0524657406==
Content-Type: multipart/alternative; boundary="15652788860.1Acb.27815"
Content-Transfer-Encoding: 7bit


--15652788860.1Acb.27815
Date: Thu, 8 Aug 2019 15:41:26 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111333

            Bug ID: 111333
           Summary: [drm:radeon_atom_pick_dig_encoder [radeon]] *ERROR*
                    chosen encoder in use 0
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/Radeon
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: t50@interia.pl

I see redline in dmesg:
[   54.401642] [drm:radeon_atom_pick_dig_encoder [radeon]] *ERROR* chosen
encoder in use 0

  ProblemType: Bug
  DistroRelease: Ubuntu 18.04
  Package: xorg 1:7.7+19ubuntu7.1
  Uname: Linux 5.2.0-050200-generic x86_64
  ApportVersion: 2.20.9-0ubuntu7.7
  Architecture: amd64
  BootLog: Error: [Errno 13] Permission denied: '/var/log/boot.log'
  CompositorRunning: None
  CurrentDesktop: ubuntu:GNOME
  Date: Tue Aug  6 10:54:51 2019
  DistUpgraded: Fresh install
  DistroCodename: bionic
  DistroVariant: ubuntu
  ExtraDebuggingInterest: Yes
  GraphicsCard:
   Advanced Micro Devices, Inc. [AMD/ATI] RV730 [Radeon HD 4600 AGP Series]
[1002:9495] (prog-if 00 [VGA controller])
     Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Radeon HD 4650/4670 =
AGP
[1002:0028]
  InstallationDate: Installed on 2018-12-22 (226 days ago)
  InstallationMedia: Ubuntu 18.04.1 LTS "Bionic Beaver" - Release amd64
(20180725)
  ProcKernelCmdLine: BOOT_IMAGE=3D/boot/vmlinuz-5.2.0-050200-generic
root=3DUUID=3D8afd3edb-2178-4c74-bd44-d4345b2160a1 ro text
resume=3DUUID=3D8afd3edb-2178-4c74-bd44-d4345b2160a1 resume_offset=3D5324800
vt.handoff=3D1
  SourcePackage: xorg
  UpgradeStatus: No upgrade log present (probably fresh install)
  dmi.bios.date: 05/21/2007
  dmi.bios.vendor: American Megatrends Inc.
  dmi.bios.version: L1.71
  dmi.board.name: ConRoe865PE
  dmi.board.version: 3.00
  dmi.modalias:
dmi:bvnAmericanMegatrendsInc.:bvrL1.71:bd05/21/2007:svn:pnConRoe865PE:pvr3.=
00:rvn:rnConRoe865PE:rvr3.00:
  dmi.product.name: ConRoe865PE
  dmi.product.version: 3.00
  version.compiz: compiz N/A
  version.libdrm2: libdrm2 2.4.97-1ubuntu1~18.04.1
  version.libgl1-mesa-dri: libgl1-mesa-dri 19.0.2-1ubuntu1.1~18.04.2
  version.libgl1-mesa-glx: libgl1-mesa-glx 19.0.2-1ubuntu1.1~18.04.2
  version.xserver-xorg-core: xserver-xorg-core 2:1.19.6-1ubuntu4.3
  version.xserver-xorg-input-evdev: xserver-xorg-input-evdev N/A
  version.xserver-xorg-video-ati: xserver-xorg-video-ati 1:18.0.1-1
  version.xserver-xorg-video-intel: xserver-xorg-video-intel
2:2.99.917+git20171229-1
  version.xserver-xorg-video-nouveau: xserver-xorg-video-nouveau 1:1.0.15-2

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15652788860.1Acb.27815
Date: Thu, 8 Aug 2019 15:41:26 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:radeon_atom_pick_dig_encoder [radeon]] *ERROR* chose=
n encoder in use 0"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111333">111333</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[drm:radeon_atom_pick_dig_encoder [radeon]] *ERROR* chosen en=
coder in use 0
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/Radeon
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>t50&#64;interia.pl
          </td>
        </tr></table>
      <p>
        <div>
        <pre>I see redline in dmesg:
[   54.401642] [drm:radeon_atom_pick_dig_encoder [radeon]] *ERROR* chosen
encoder in use 0

  ProblemType: Bug
  DistroRelease: Ubuntu 18.04
  Package: xorg 1:7.7+19ubuntu7.1
  Uname: Linux 5.2.0-050200-generic x86_64
  ApportVersion: 2.20.9-0ubuntu7.7
  Architecture: amd64
  BootLog: Error: [Errno 13] Permission denied: '/var/log/boot.log'
  CompositorRunning: None
  CurrentDesktop: ubuntu:GNOME
  Date: Tue Aug  6 10:54:51 2019
  DistUpgraded: Fresh install
  DistroCodename: bionic
  DistroVariant: ubuntu
  ExtraDebuggingInterest: Yes
  GraphicsCard:
   Advanced Micro Devices, Inc. [AMD/ATI] RV730 [Radeon HD 4600 AGP Series]
[1002:9495] (prog-if 00 [VGA controller])
     Subsystem: Advanced Micro Devices, Inc. [AMD/ATI] Radeon HD 4650/4670 =
AGP
[1002:0028]
  InstallationDate: Installed on 2018-12-22 (226 days ago)
  InstallationMedia: Ubuntu 18.04.1 LTS &quot;Bionic Beaver&quot; - Release=
 amd64
(20180725)
  ProcKernelCmdLine: BOOT_IMAGE=3D/boot/vmlinuz-5.2.0-050200-generic
root=3DUUID=3D8afd3edb-2178-4c74-bd44-d4345b2160a1 ro text
resume=3DUUID=3D8afd3edb-2178-4c74-bd44-d4345b2160a1 resume_offset=3D5324800
vt.handoff=3D1
  SourcePackage: xorg
  UpgradeStatus: No upgrade log present (probably fresh install)
  dmi.bios.date: 05/21/2007
  dmi.bios.vendor: American Megatrends Inc.
  dmi.bios.version: L1.71
  dmi.board.name: ConRoe865PE
  dmi.board.version: 3.00
  dmi.modalias:
dmi:bvnAmericanMegatrendsInc.:bvrL1.71:bd05/21/2007:svn:pnConRoe865PE:pvr3.=
00:rvn:rnConRoe865PE:rvr3.00:
  dmi.product.name: ConRoe865PE
  dmi.product.version: 3.00
  version.compiz: compiz N/A
  version.libdrm2: libdrm2 2.4.97-1ubuntu1~18.04.1
  version.libgl1-mesa-dri: libgl1-mesa-dri 19.0.2-1ubuntu1.1~18.04.2
  version.libgl1-mesa-glx: libgl1-mesa-glx 19.0.2-1ubuntu1.1~18.04.2
  version.xserver-xorg-core: xserver-xorg-core 2:1.19.6-1ubuntu4.3
  version.xserver-xorg-input-evdev: xserver-xorg-input-evdev N/A
  version.xserver-xorg-video-ati: xserver-xorg-video-ati 1:18.0.1-1
  version.xserver-xorg-video-intel: xserver-xorg-video-intel
2:2.99.917+git20171229-1
  version.xserver-xorg-video-nouveau: xserver-xorg-video-nouveau 1:1.0.15-2=
</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15652788860.1Acb.27815--

--===============0524657406==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0524657406==--
