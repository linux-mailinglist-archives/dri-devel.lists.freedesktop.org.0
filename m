Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 136C26B718
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 09:03:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 951D86E249;
	Wed, 17 Jul 2019 07:03:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id DE58E6E249
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 07:03:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DAC3272167; Wed, 17 Jul 2019 07:03:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111103] [Patch] to compile amdgpu-dkms 19.20 on debian stretch
 & buster
Date: Wed, 17 Jul 2019 07:03:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fabstz-it@yahoo.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111103-502-QheQNE80cR@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111103-502@http.bugs.freedesktop.org/>
References: <bug-111103-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0437983088=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0437983088==
Content-Type: multipart/alternative; boundary="15633469831.D2ffC25.16234"
Content-Transfer-Encoding: 7bit


--15633469831.D2ffC25.16234
Date: Wed, 17 Jul 2019 07:03:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111103

--- Comment #1 from Fab Stz <fabstz-it@yahoo.fr> ---
Created attachment 144809
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144809&action=3Dedit
[Patch] to compile amdgpu-dkms 19.20 on debian stretch & buster (v2)

Same patch as before but using #if to manage different kernel versions

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15633469831.D2ffC25.16234
Date: Wed, 17 Jul 2019 07:03:03 +0000
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
   title=3D"NEW - [Patch] to compile amdgpu-dkms 19.20 on debian stretch &a=
mp; buster"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111103#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Patch] to compile amdgpu-dkms 19.20 on debian stretch &a=
mp; buster"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111103">bug 11110=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fabstz-it&#64;yahoo.fr" title=3D"Fab Stz &lt;fabstz-it&#64;yahoo.fr&gt;"> <=
span class=3D"fn">Fab Stz</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144809=
" name=3D"attach_144809" title=3D"[Patch] to compile amdgpu-dkms 19.20 on d=
ebian stretch &amp; buster (v2)">attachment 144809</a> <a href=3D"attachmen=
t.cgi?id=3D144809&amp;action=3Dedit" title=3D"[Patch] to compile amdgpu-dkm=
s 19.20 on debian stretch &amp; buster (v2)">[details]</a></span> <a href=
=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D111103&amp;attachment=3D144809'>[=
review]</a>
[Patch] to compile amdgpu-dkms 19.20 on debian stretch &amp; buster (v2)

Same patch as before but using #if to manage different kernel versions</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15633469831.D2ffC25.16234--

--===============0437983088==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0437983088==--
