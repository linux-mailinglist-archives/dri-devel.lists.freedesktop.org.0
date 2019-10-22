Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0C7E07DF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 17:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA1026E85C;
	Tue, 22 Oct 2019 15:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id AD9286E861
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 15:50:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AA5C7720E2; Tue, 22 Oct 2019 15:50:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Tue, 22 Oct 2019 15:50:23 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: bugs@thschuetz.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-QovX0d4UZd@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111481-502@http.bugs.freedesktop.org/>
References: <bug-111481-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1318319972=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1318319972==
Content-Type: multipart/alternative; boundary="15717594249.DEFFa4.29328"
Content-Transfer-Encoding: 7bit


--15717594249.DEFFa4.29328
Date: Tue, 22 Oct 2019 15:50:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #121 from bugs@thschuetz.de ---
I have the same problem using archlinux. I tried mesa+llvm stable (19.2/9.0=
),
the git-versions with amdgpu and even with plain modesetting. I have random
freezes with xfce (with and without compositor) and nearly immediatly freez=
es
with Rise of the Tomb Raider. "Freezing" means X11, Magic SysRQ and SSH sti=
ll
works.
I had to remove the card because the computer was competely unusable with 4
freezes in 15 minutes. So I can't provide you with more information, sorry.
But if I can give you any information without putting the card back into the
computer (the slot has suffered a bit...) I am here.

Now I found this bug report and wonder, why it is 8 weeks old, still "new" =
and
unassigned and severity is not set. In my opinion a freezing computer is re=
ally
critical!=20

And I wonder why the bug is only at Arch/Manjaro and Ubuntu. Are all other
distris too old to work with Navi completely? I didn't even found a report =
from
Gentoo.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15717594249.DEFFa4.29328
Date: Tue, 22 Oct 2019 15:50:24 +0000
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
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c121">Comm=
ent # 121</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bugs&#64;thschuetz.de" title=3D"bugs&#64;thschuetz.de">bugs&#64;thschuetz.d=
e</a>
</span></b>
        <pre>I have the same problem using archlinux. I tried mesa+llvm sta=
ble (19.2/9.0),
the git-versions with amdgpu and even with plain modesetting. I have random
freezes with xfce (with and without compositor) and nearly immediatly freez=
es
with Rise of the Tomb Raider. &quot;Freezing&quot; means X11, Magic SysRQ a=
nd SSH still
works.
I had to remove the card because the computer was competely unusable with 4
freezes in 15 minutes. So I can't provide you with more information, sorry.
But if I can give you any information without putting the card back into the
computer (the slot has suffered a bit...) I am here.

Now I found this bug report and wonder, why it is 8 weeks old, still &quot;=
new&quot; and
unassigned and severity is not set. In my opinion a freezing computer is re=
ally
critical!=20

And I wonder why the bug is only at Arch/Manjaro and Ubuntu. Are all other
distris too old to work with Navi completely? I didn't even found a report =
from
Gentoo.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15717594249.DEFFa4.29328--

--===============1318319972==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1318319972==--
