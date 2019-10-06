Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1B6CD892
	for <lists+dri-devel@lfdr.de>; Sun,  6 Oct 2019 20:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F1D6E430;
	Sun,  6 Oct 2019 18:16:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5F42A6E430
 for <dri-devel@lists.freedesktop.org>; Sun,  6 Oct 2019 18:15:59 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 53F9272162; Sun,  6 Oct 2019 18:15:59 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111889] Severe glitches in cinnamon/gnome3 affecting small
 rectangular areas (menus, dialogs)
Date: Sun, 06 Oct 2019 18:15:59 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: sdiconov@mail.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111889-502-qOpV1bCTKx@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111889-502@http.bugs.freedesktop.org/>
References: <bug-111889-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0370662624=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0370662624==
Content-Type: multipart/alternative; boundary="15703857590.D2f86D32.17716"
Content-Transfer-Encoding: 7bit


--15703857590.D2f86D32.17716
Date: Sun, 6 Oct 2019 18:15:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111889

--- Comment #7 from sdiconov@mail.ru ---
(In reply to Alex Deucher from comment #6)
> What component (mesa, kernel, etc.) did you change which caused the
> regression?

It is difficult to tell exactly. The regression developed during a series of
whole-system upgrades executed by the command "apt-get dist-upgrade". It
included minor kernel upgrades in the range of 4.19.xx.

I primarily suspected cinnamon built-in compositor before. Now I would prob=
ably
blame the code coming in the packeage "xorg-drv-radeon". I lack the knowled=
ge
needed to say if mesa or gtk3 are responsible too.

Current versions are:
xorg-drv-radeon-19.0.1-alt1.x86_64

libGLX-mesa-19.1.7-alt1.x86_64
libEGL-mesa-19.1.7-alt1.x86_64

libclutter-gtk3-1.8.4-alt1.x86_64
libgtk+3-3.24.11-alt1.x86_64
cinnamon-4.2.4-alt2.x86_64

if that helps.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15703857590.D2f86D32.17716
Date: Sun, 6 Oct 2019 18:15:59 +0000
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
   title=3D"NEW - Severe glitches in cinnamon/gnome3 affecting small rectan=
gular areas (menus, dialogs)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111889#c7">Commen=
t # 7</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Severe glitches in cinnamon/gnome3 affecting small rectan=
gular areas (menus, dialogs)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111889">bug 11188=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sdiconov&#64;mail.ru" title=3D"sdiconov&#64;mail.ru">sdiconov&#64;mail.ru</=
a>
</span></b>
        <pre>(In reply to Alex Deucher from <a href=3D"show_bug.cgi?id=3D11=
1889#c6">comment #6</a>)
<span class=3D"quote">&gt; What component (mesa, kernel, etc.) did you chan=
ge which caused the
&gt; regression?</span >

It is difficult to tell exactly. The regression developed during a series of
whole-system upgrades executed by the command &quot;apt-get dist-upgrade&qu=
ot;. It
included minor kernel upgrades in the range of 4.19.xx.

I primarily suspected cinnamon built-in compositor before. Now I would prob=
ably
blame the code coming in the packeage &quot;xorg-drv-radeon&quot;. I lack t=
he knowledge
needed to say if mesa or gtk3 are responsible too.

Current versions are:
xorg-drv-radeon-19.0.1-alt1.x86_64

libGLX-mesa-19.1.7-alt1.x86_64
libEGL-mesa-19.1.7-alt1.x86_64

libclutter-gtk3-1.8.4-alt1.x86_64
libgtk+3-3.24.11-alt1.x86_64
cinnamon-4.2.4-alt2.x86_64

if that helps.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15703857590.D2f86D32.17716--

--===============0370662624==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0370662624==--
