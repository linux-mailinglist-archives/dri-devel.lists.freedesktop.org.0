Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC6BACA51
	for <lists+dri-devel@lfdr.de>; Sun,  8 Sep 2019 04:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29FC7892CA;
	Sun,  8 Sep 2019 02:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D93E189CDE
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Sep 2019 02:02:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D1A6E72161; Sun,  8 Sep 2019 02:02:25 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111232] 3200 Memory Crash  My System
Date: Sun, 08 Sep 2019 02:02:26 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: bibitocarlos@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111232-502-H0sT8T1FGF@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111232-502@http.bugs.freedesktop.org/>
References: <bug-111232-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1798484669=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1798484669==
Content-Type: multipart/alternative; boundary="15679081450.CE2eA11b.28549"
Content-Transfer-Encoding: 7bit


--15679081450.CE2eA11b.28549
Date: Sun, 8 Sep 2019 02:02:25 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111232

--- Comment #4 from bibitocarlos <bibitocarlos@gmail.com> ---
I have finished bisecting.
This is the commit which created the bug :=20
" Bissection=C2=A0: 0 r=C3=A9vision =C3=A0 tester apr=C3=A8s ceci (=C3=A0 p=
eu pr=C3=A8s 0 =C3=A9tape)
[005440066f929ba0dca8f4e0aebfbf8daac592cc] drm/amdgpu: enable gfxoff again =
on
raven series (v2)"

What do i do next ?

Bibi

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15679081450.CE2eA11b.28549
Date: Sun, 8 Sep 2019 02:02:25 +0000
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
   title=3D"NEW - 3200 Memory Crash My System"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111232#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 3200 Memory Crash My System"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111232">bug 11123=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bibitocarlos&#64;gmail.com" title=3D"bibitocarlos &lt;bibitocarlos&#64;gmai=
l.com&gt;"> <span class=3D"fn">bibitocarlos</span></a>
</span></b>
        <pre>I have finished bisecting.
This is the commit which created the bug :=20
&quot; Bissection=C2=A0: 0 r=C3=A9vision =C3=A0 tester apr=C3=A8s ceci (=C3=
=A0 peu pr=C3=A8s 0 =C3=A9tape)
[005440066f929ba0dca8f4e0aebfbf8daac592cc] drm/amdgpu: enable gfxoff again =
on
raven series (v2)&quot;

What do i do next ?

Bibi</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15679081450.CE2eA11b.28549--

--===============1798484669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1798484669==--
