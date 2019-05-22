Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91C4026677
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2019 17:02:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 554FE893C9;
	Wed, 22 May 2019 15:01:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 76106893C9
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2019 15:01:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4C28472167; Wed, 22 May 2019 15:01:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110575] [R9 380X] Artifacts in CSGO
Date: Wed, 22 May 2019 15:01:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tempel.julian@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110575-502-hcGzifHqsU@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110575-502@http.bugs.freedesktop.org/>
References: <bug-110575-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0920922476=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0920922476==
Content-Type: multipart/alternative; boundary="15585373180.4E608689.12466"
Content-Transfer-Encoding: 7bit


--15585373180.4E608689.12466
Date: Wed, 22 May 2019 15:01:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110575

--- Comment #3 from tempel.julian@gmail.com ---
Can you try R600_DEBUG=3Dnohyperz? I have this kind of glitches in almost e=
very
game with OpenGL/Gallium Nine on Polaris and this variable seems to help at
least in Skyrim with Gallium Nine (haven't tested anything else so far).

My bug report:
https://bugs.freedesktop.org/show_bug.cgi?id=3D110635

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15585373180.4E608689.12466
Date: Wed, 22 May 2019 15:01:58 +0000
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
   title=3D"NEW - [R9 380X] Artifacts in CSGO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110575#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [R9 380X] Artifacts in CSGO"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110575">bug 11057=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
tempel.julian&#64;gmail.com" title=3D"tempel.julian&#64;gmail.com">tempel.j=
ulian&#64;gmail.com</a>
</span></b>
        <pre>Can you try R600_DEBUG=3Dnohyperz? I have this kind of glitche=
s in almost every
game with OpenGL/Gallium Nine on Polaris and this variable seems to help at
least in Skyrim with Gallium Nine (haven't tested anything else so far).

My bug report:
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - briefly flashing corruption when playing various OGL game=
s"
   href=3D"show_bug.cgi?id=3D110635">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110635</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15585373180.4E608689.12466--

--===============0920922476==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0920922476==--
