Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7E8D571E
	for <lists+dri-devel@lfdr.de>; Sun, 13 Oct 2019 19:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67C696E15D;
	Sun, 13 Oct 2019 17:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 4C47F6E15D
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Oct 2019 17:50:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 4335B7296E; Sun, 13 Oct 2019 17:50:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111986] 5700 XT hangs entire system in games
Date: Sun, 13 Oct 2019 17:50:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: danielsuarez369@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111986-502-Lz8uOn1coH@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111986-502@http.bugs.freedesktop.org/>
References: <bug-111986-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0448598892=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0448598892==
Content-Type: multipart/alternative; boundary="15709890010.dee65.30059"
Content-Transfer-Encoding: 7bit


--15709890010.dee65.30059
Date: Sun, 13 Oct 2019 17:50:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111986

--- Comment #6 from Daniel Suarez <danielsuarez369@protonmail.com> ---
Created attachment 145728
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145728&action=3Dedit
Xorg log

I switched over to mesa-git (along with all the other packages recommended =
to
accompany it mentioned in the Arch wiki) and the same exact issue occurs, t=
his
is the log found in "/var/log/Xorg.0.log.old", grabbed it right after booti=
ng
in after having been forced to shutdown when my PC froze when running GFXBe=
nch

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15709890010.dee65.30059
Date: Sun, 13 Oct 2019 17:50:01 +0000
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
   title=3D"NEW - 5700 XT hangs entire system in games"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111986#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - 5700 XT hangs entire system in games"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111986">bug 11198=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
danielsuarez369&#64;protonmail.com" title=3D"Daniel Suarez &lt;danielsuarez=
369&#64;protonmail.com&gt;"> <span class=3D"fn">Daniel Suarez</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145728=
" name=3D"attach_145728" title=3D"Xorg log">attachment 145728</a> <a href=
=3D"attachment.cgi?id=3D145728&amp;action=3Dedit" title=3D"Xorg log">[detai=
ls]</a></span>
Xorg log

I switched over to mesa-git (along with all the other packages recommended =
to
accompany it mentioned in the Arch wiki) and the same exact issue occurs, t=
his
is the log found in &quot;/var/log/Xorg.0.log.old&quot;, grabbed it right a=
fter booting
in after having been forced to shutdown when my PC froze when running GFXBe=
nch</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15709890010.dee65.30059--

--===============0448598892==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0448598892==--
