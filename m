Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19704ECDDC
	for <lists+dri-devel@lfdr.de>; Sat,  2 Nov 2019 10:37:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFBE06E3D0;
	Sat,  2 Nov 2019 09:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A21F56E3E3
 for <dri-devel@lists.freedesktop.org>; Sat,  2 Nov 2019 09:37:23 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9EDC0720E2; Sat,  2 Nov 2019 09:37:23 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108521] RX 580 as eGPU amdgpu: gpu post error!
Date: Sat, 02 Nov 2019 09:37:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: werbungspam@outlook.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108521-502-8bj7Jk2LLC@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108521-502@http.bugs.freedesktop.org/>
References: <bug-108521-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1797773787=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1797773787==
Content-Type: multipart/alternative; boundary="15726874433.3d880.4976"
Content-Transfer-Encoding: 7bit


--15726874433.3d880.4976
Date: Sat, 2 Nov 2019 09:37:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108521

--- Comment #56 from kumquad <werbungspam@outlook.com> ---
More tests:

*pci=3Dnoacpi
PC is booting but either it freezes right after booting to GNOME or it bloc=
ks
the Touchpad/USB mouse/keyboard/Tochscreen from working

*amdgpu.dpm=3D0 or acpi=3Doff
Screen turns black and nothing happens anymore

Another thing I noticed:
Sometimes when booting, GRUB shows on the external monitor hoocked up to the
eGPU and not on the Laptops internal one. But as soon as Linux starts it
switches back to the internal monitor. If I select Windows the whole boot
continues on the eGPU-monitor.

I also made a thread in the manjaro-forum two days ago. There you can also =
find
some more logs from my machine/system/configuration:
https://forum.manjaro.org/t/help-setting-up-egpu-stuck-on-boot-when-connect=
ed/109583/10

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15726874433.3d880.4976
Date: Sat, 2 Nov 2019 09:37:23 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - RX 580 as eGPU amdgpu: gpu post error!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108521#c56">Comme=
nt # 56</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - RX 580 as eGPU amdgpu: gpu post error!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108521">bug 10852=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
werbungspam&#64;outlook.com" title=3D"kumquad &lt;werbungspam&#64;outlook.c=
om&gt;"> <span class=3D"fn">kumquad</span></a>
</span></b>
        <pre>More tests:

*pci=3Dnoacpi
PC is booting but either it freezes right after booting to GNOME or it bloc=
ks
the Touchpad/USB mouse/keyboard/Tochscreen from working

*amdgpu.dpm=3D0 or acpi=3Doff
Screen turns black and nothing happens anymore

Another thing I noticed:
Sometimes when booting, GRUB shows on the external monitor hoocked up to the
eGPU and not on the Laptops internal one. But as soon as Linux starts it
switches back to the internal monitor. If I select Windows the whole boot
continues on the eGPU-monitor.

I also made a thread in the manjaro-forum two days ago. There you can also =
find
some more logs from my machine/system/configuration:
<a href=3D"https://forum.manjaro.org/t/help-setting-up-egpu-stuck-on-boot-w=
hen-connected/109583/10">https://forum.manjaro.org/t/help-setting-up-egpu-s=
tuck-on-boot-when-connected/109583/10</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15726874433.3d880.4976--

--===============1797773787==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1797773787==--
