Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378372BBFE
	for <lists+dri-devel@lfdr.de>; Tue, 28 May 2019 00:31:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DAE489A5D;
	Mon, 27 May 2019 22:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3842D89A5D
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 22:31:49 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 2DF3A72167; Mon, 27 May 2019 22:31:49 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110711] American Truck Simulator shows strange colored
 reflections
Date: Mon, 27 May 2019 22:31:49 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: petr@scssoft.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110711-502-gS0X6xwkdL@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110711-502@http.bugs.freedesktop.org/>
References: <bug-110711-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1235311551=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1235311551==
Content-Type: multipart/alternative; boundary="15589963090.F74dCe0.18182"
Content-Transfer-Encoding: 7bit


--15589963090.F74dCe0.18182
Date: Mon, 27 May 2019 22:31:49 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110711

--- Comment #2 from Petr Sebor <petr@scssoft.com> ---
Whoops, this one got unnoticed (unreported?) for quite some time it seems.
However, the game is still evolving and the rendering code improving over t=
he
years. If there is a performance overhead tied together to zeroing VRAM, I'd
rather fix the game. I can do that. Please do not add workarounds if that is
going to hurt the game performance.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15589963090.F74dCe0.18182
Date: Mon, 27 May 2019 22:31:49 +0000
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
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - American Truck Simulator shows strange colored refle=
ctions"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110711#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_ASSIGNED "
   title=3D"ASSIGNED - American Truck Simulator shows strange colored refle=
ctions"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110711">bug 11071=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
petr&#64;scssoft.com" title=3D"Petr Sebor &lt;petr&#64;scssoft.com&gt;"> <s=
pan class=3D"fn">Petr Sebor</span></a>
</span></b>
        <pre>Whoops, this one got unnoticed (unreported?) for quite some ti=
me it seems.
However, the game is still evolving and the rendering code improving over t=
he
years. If there is a performance overhead tied together to zeroing VRAM, I'd
rather fix the game. I can do that. Please do not add workarounds if that is
going to hurt the game performance.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15589963090.F74dCe0.18182--

--===============1235311551==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1235311551==--
