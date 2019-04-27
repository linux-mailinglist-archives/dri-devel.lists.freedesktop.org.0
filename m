Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0219EB479
	for <lists+dri-devel@lfdr.de>; Sat, 27 Apr 2019 22:20:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1559889226;
	Sat, 27 Apr 2019 20:20:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A482B89226
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Apr 2019 20:20:54 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A0F0C7215F; Sat, 27 Apr 2019 20:20:54 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 105651] Vega64 doesn't output properly onto dell up2715k at
 5120x2880
Date: Sat, 27 Apr 2019 20:20:54 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: spgle212@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: resolution bug_status
Message-ID: <bug-105651-502-9jxcLm5YuZ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-105651-502@http.bugs.freedesktop.org/>
References: <bug-105651-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1171749895=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1171749895==
Content-Type: multipart/alternative; boundary="15563964543.3492d690.31306"
Content-Transfer-Encoding: 7bit


--15563964543.3492d690.31306
Date: Sat, 27 Apr 2019 20:20:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105651

spgle212@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
         Resolution|NOTOURBUG                   |---
             Status|RESOLVED                    |REOPENED

--- Comment #3 from spgle212@gmail.com ---
Yes it is handled at Desktop level.
(https://gitlab.gnome.org/GNOME/mutter/issues/110)

But the tile property has to be exposed from kernel driver as far as i
understand. Which was not the case in my setup with amdgpu. With the new pa=
tch
from here
https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgpu/merge_requests=
/32
it should work but i can not see any tiled properties.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15563964543.3492d690.31306
Date: Sat, 27 Apr 2019 20:20:54 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:spgle212&=
#64;gmail.com" title=3D"spgle212&#64;gmail.com">spgle212&#64;gmail.com</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Vega64 doesn't output properly onto dell up2715k at =
5120x2880"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105651">bug 10565=
1</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>NOTOURBUG
           </td>
           <td>---
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>RESOLVED
           </td>
           <td>REOPENED
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Vega64 doesn't output properly onto dell up2715k at =
5120x2880"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105651#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Vega64 doesn't output properly onto dell up2715k at =
5120x2880"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105651">bug 10565=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
spgle212&#64;gmail.com" title=3D"spgle212&#64;gmail.com">spgle212&#64;gmail=
.com</a>
</span></b>
        <pre>Yes it is handled at Desktop level.
(<a href=3D"https://gitlab.gnome.org/GNOME/mutter/issues/110">https://gitla=
b.gnome.org/GNOME/mutter/issues/110</a>)

But the tile property has to be exposed from kernel driver as far as i
understand. Which was not the case in my setup with amdgpu. With the new pa=
tch
from here
<a href=3D"https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgpu/mer=
ge_requests/32">https://gitlab.freedesktop.org/xorg/driver/xf86-video-amdgp=
u/merge_requests/32</a>
it should work but i can not see any tiled properties.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15563964543.3492d690.31306--

--===============1171749895==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1171749895==--
