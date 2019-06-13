Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4308A44FF0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2019 01:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB72E892FF;
	Thu, 13 Jun 2019 23:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B1DF98935C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2019 23:19:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AE89372167; Thu, 13 Jun 2019 23:19:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 102646] Screen flickering under amdgpu-experimental [buggy auto
 power profile]
Date: Thu, 13 Jun 2019 23:19:21 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: issethlorecanth@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-102646-502-0fRBlrnZtT@http.bugs.freedesktop.org/>
In-Reply-To: <bug-102646-502@http.bugs.freedesktop.org/>
References: <bug-102646-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1449692569=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1449692569==
Content-Type: multipart/alternative; boundary="15604679626.a9e76A.23946"
Content-Transfer-Encoding: 7bit


--15604679626.a9e76A.23946
Date: Thu, 13 Jun 2019 23:19:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102646

Seth Lorecanth <issethlorecanth@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |issethlorecanth@gmail.com

--- Comment #93 from Seth Lorecanth <issethlorecanth@gmail.com> ---
GPU/Stack RX 560/amdgpu/linux console
CPU: R7 2700X
Distro/Kernel: LFS/5.1.5

I have been experiencing what appears to be the same issue on any kernel ne=
wer
than 4.14 that I=E2=80=99ve tried. I had been running Manjaro 4.14 which wo=
rks fine,
but I briefly tried LFS and discovered this issue. I=E2=80=99ve tried some =
different
kernels, but all the ones after 4.14 exhibit the same issue.=20

The video shows a single flicker, but the flickers occur fairly regularly w=
hen
scrolling.=20

https://youtu.be/W-z1i2bevn0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15604679626.a9e76A.23946
Date: Thu, 13 Jun 2019 23:19:22 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:issethlor=
ecanth&#64;gmail.com" title=3D"Seth Lorecanth &lt;issethlorecanth&#64;gmail=
.com&gt;"> <span class=3D"fn">Seth Lorecanth</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102646">bug 10264=
6</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">CC</td>
           <td>
               &nbsp;
           </td>
           <td>issethlorecanth&#64;gmail.com
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102646#c93">Comme=
nt # 93</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Screen flickering under amdgpu-experimental [buggy auto p=
ower profile]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102646">bug 10264=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
issethlorecanth&#64;gmail.com" title=3D"Seth Lorecanth &lt;issethlorecanth&=
#64;gmail.com&gt;"> <span class=3D"fn">Seth Lorecanth</span></a>
</span></b>
        <pre>GPU/Stack RX 560/amdgpu/linux console
CPU: R7 2700X
Distro/Kernel: LFS/5.1.5

I have been experiencing what appears to be the same issue on any kernel ne=
wer
than 4.14 that I=E2=80=99ve tried. I had been running Manjaro 4.14 which wo=
rks fine,
but I briefly tried LFS and discovered this issue. I=E2=80=99ve tried some =
different
kernels, but all the ones after 4.14 exhibit the same issue.=20

The video shows a single flicker, but the flickers occur fairly regularly w=
hen
scrolling.=20

<a href=3D"https://youtu.be/W-z1i2bevn0">https://youtu.be/W-z1i2bevn0</a></=
pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15604679626.a9e76A.23946--

--===============1449692569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1449692569==--
