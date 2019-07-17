Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D16F16B708
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jul 2019 08:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA056E23D;
	Wed, 17 Jul 2019 06:57:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A37506E23D
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jul 2019 06:57:49 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9FE7F72168; Wed, 17 Jul 2019 06:57:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110898] [Patch] to compile amdgpu-dkms 19.10 on debian stretch
 & buster
Date: Wed, 17 Jul 2019 06:57:49 +0000
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
Message-ID: <bug-110898-502-pmDeZCyw2I@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110898-502@http.bugs.freedesktop.org/>
References: <bug-110898-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1545527308=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1545527308==
Content-Type: multipart/alternative; boundary="15633466691.4deBc1B89.15883"
Content-Transfer-Encoding: 7bit


--15633466691.4deBc1B89.15883
Date: Wed, 17 Jul 2019 06:57:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110898

--- Comment #1 from Fab Stz <fabstz-it@yahoo.fr> ---
Created attachment 144808
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144808&action=3Dedit
Newer patch

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15633466691.4deBc1B89.15883
Date: Wed, 17 Jul 2019 06:57:49 +0000
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
   title=3D"NEW - [Patch] to compile amdgpu-dkms 19.10 on debian stretch &a=
mp; buster"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110898#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Patch] to compile amdgpu-dkms 19.10 on debian stretch &a=
mp; buster"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110898">bug 11089=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
fabstz-it&#64;yahoo.fr" title=3D"Fab Stz &lt;fabstz-it&#64;yahoo.fr&gt;"> <=
span class=3D"fn">Fab Stz</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144808=
" name=3D"attach_144808" title=3D"Newer patch">attachment 144808</a> <a hre=
f=3D"attachment.cgi?id=3D144808&amp;action=3Dedit" title=3D"Newer patch">[d=
etails]</a></span> <a href=3D'page.cgi?id=3Dsplinter.html&amp;bug=3D110898&=
amp;attachment=3D144808'>[review]</a>
Newer patch</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15633466691.4deBc1B89.15883--

--===============1545527308==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1545527308==--
