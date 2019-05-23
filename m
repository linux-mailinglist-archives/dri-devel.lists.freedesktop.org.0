Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3779D285EB
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2019 20:30:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7CB289FF9;
	Thu, 23 May 2019 18:29:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 840BA89FF9
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2019 18:29:58 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 811B272167; Thu, 23 May 2019 18:29:58 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110736] Spotify rendering issues
Date: Thu, 23 May 2019 18:29:58 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: b747xx@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110736-502-ezgI7Q9rud@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110736-502@http.bugs.freedesktop.org/>
References: <bug-110736-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1909049817=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1909049817==
Content-Type: multipart/alternative; boundary="15586361981.6e62.6476"
Content-Transfer-Encoding: 7bit


--15586361981.6e62.6476
Date: Thu, 23 May 2019 18:29:58 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110736

--- Comment #1 from Mathieu Belanger <b747xx@gmail.com> ---
I have the same bug

It started yesterday after a reboot.

Between the reboot and the previous reboot I did emerge -e the whole things=
 so
I'm not totally sure it's mesa related

I have the bug in:
 * Discord (only the rotating Discord logo when I load it, it spin like 30x=
 on
itself in the same amount of time it usually spin one time on itself.)
 * Brave browser (corruptopia like OP screen shot)
 * Chromium (partially, just the scroll bar)

@Zak, is there is something else you also updated recently? Like libdrm, xo=
rg
parts, llvm?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15586361981.6e62.6476
Date: Thu, 23 May 2019 18:29:58 +0000
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
   title=3D"NEW - Spotify rendering issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110736#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Spotify rendering issues"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110736">bug 11073=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
b747xx&#64;gmail.com" title=3D"Mathieu Belanger &lt;b747xx&#64;gmail.com&gt=
;"> <span class=3D"fn">Mathieu Belanger</span></a>
</span></b>
        <pre>I have the same bug

It started yesterday after a reboot.

Between the reboot and the previous reboot I did emerge -e the whole things=
 so
I'm not totally sure it's mesa related

I have the bug in:
 * Discord (only the rotating Discord logo when I load it, it spin like 30x=
 on
itself in the same amount of time it usually spin one time on itself.)
 * Brave browser (corruptopia like OP screen shot)
 * Chromium (partially, just the scroll bar)

&#64;Zak, is there is something else you also updated recently? Like libdrm=
, xorg
parts, llvm?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15586361981.6e62.6476--

--===============1909049817==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1909049817==--
