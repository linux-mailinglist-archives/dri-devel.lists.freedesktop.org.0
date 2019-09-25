Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BECBDFD6
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 16:16:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96B626EBDE;
	Wed, 25 Sep 2019 14:16:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id C54596EBD8
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 14:16:29 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C24B072162; Wed, 25 Sep 2019 14:16:29 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107296] WARNING: CPU: 0 PID: 370 at
 drivers/gpu/drm/amd/amdgpu/../display/dc/calcs/dcn_calcs.c:1355
 dcn_bw_update_from_pplib+0x16b/0x280 [amdgpu]
Date: Wed, 25 Sep 2019 14:16:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: frido.ferdinand@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-107296-502-kJ8dbJF8KT@http.bugs.freedesktop.org/>
In-Reply-To: <bug-107296-502@http.bugs.freedesktop.org/>
References: <bug-107296-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1643892187=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1643892187==
Content-Type: multipart/alternative; boundary="15694209894.355A.18022"
Content-Transfer-Encoding: 7bit


--15694209894.355A.18022
Date: Wed, 25 Sep 2019 14:16:29 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107296

--- Comment #19 from frido.ferdinand@gmail.com ---
Same problem, initially installed arch with an nvidia 970 card, later switc=
hed
to internal vega graphics on displayport with 144hz monitor now blank
(flickering) screen on boot. Details:

5.3.1-arch1-1-ARCH
ROG STRIX B450-F GAMING, BIOS 2801 09/18/2019
AMD Ryzen 5 2400G with Radeon Vega Graphics (Using displayport)
GeForce GTX 970

dmesg attached.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15694209894.355A.18022
Date: Wed, 25 Sep 2019 14:16:29 +0000
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
          bz_status_NEW "
   title=3D"NEW - WARNING: CPU: 0 PID: 370 at drivers/gpu/drm/amd/amdgpu/..=
/display/dc/calcs/dcn_calcs.c:1355 dcn_bw_update_from_pplib+0x16b/0x280 [am=
dgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107296#c19">Comme=
nt # 19</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING: CPU: 0 PID: 370 at drivers/gpu/drm/amd/amdgpu/..=
/display/dc/calcs/dcn_calcs.c:1355 dcn_bw_update_from_pplib+0x16b/0x280 [am=
dgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107296">bug 10729=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
frido.ferdinand&#64;gmail.com" title=3D"frido.ferdinand&#64;gmail.com">frid=
o.ferdinand&#64;gmail.com</a>
</span></b>
        <pre>Same problem, initially installed arch with an nvidia 970 card=
, later switched
to internal vega graphics on displayport with 144hz monitor now blank
(flickering) screen on boot. Details:

5.3.1-arch1-1-ARCH
ROG STRIX B450-F GAMING, BIOS 2801 09/18/2019
AMD Ryzen 5 2400G with Radeon Vega Graphics (Using displayport)
GeForce GTX 970

dmesg attached.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15694209894.355A.18022--

--===============1643892187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1643892187==--
