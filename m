Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DB96FDDB
	for <lists+dri-devel@lfdr.de>; Mon, 22 Jul 2019 12:33:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02767899BC;
	Mon, 22 Jul 2019 10:33:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 065E4899BC
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Jul 2019 10:33:06 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 00BE272167; Mon, 22 Jul 2019 10:33:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111182] Fade-to-white after KMS is set on RV635
Date: Mon, 22 Jul 2019 10:33:06 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: thumperward@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111182-502-QkQNgvQySj@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111182-502@http.bugs.freedesktop.org/>
References: <bug-111182-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0091415537=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0091415537==
Content-Type: multipart/alternative; boundary="15637915851.BB21dE8C.24152"
Content-Transfer-Encoding: 7bit


--15637915851.BB21dE8C.24152
Date: Mon, 22 Jul 2019 10:33:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111182

--- Comment #1 from Chris Cunningham <thumperward@hotmail.com> ---
Created attachment 144838
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144838&action=3Dedit
Fedora 30 livecd dmesg showing the same thing

Just checked a Fedora LiveCD, which did the same thing (whited out) on first
attempt, then successfully booted after a restart. dmesg output attached - =
note
lines 997-1003, showing the same errors as in Debian.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15637915851.BB21dE8C.24152
Date: Mon, 22 Jul 2019 10:33:05 +0000
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
   title=3D"NEW - Fade-to-white after KMS is set on RV635"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111182#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Fade-to-white after KMS is set on RV635"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111182">bug 11118=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
thumperward&#64;hotmail.com" title=3D"Chris Cunningham &lt;thumperward&#64;=
hotmail.com&gt;"> <span class=3D"fn">Chris Cunningham</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144838=
" name=3D"attach_144838" title=3D"Fedora 30 livecd dmesg showing the same t=
hing">attachment 144838</a> <a href=3D"attachment.cgi?id=3D144838&amp;actio=
n=3Dedit" title=3D"Fedora 30 livecd dmesg showing the same thing">[details]=
</a></span>
Fedora 30 livecd dmesg showing the same thing

Just checked a Fedora LiveCD, which did the same thing (whited out) on first
attempt, then successfully booted after a restart. dmesg output attached - =
note
lines 997-1003, showing the same errors as in Debian.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15637915851.BB21dE8C.24152--

--===============0091415537==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0091415537==--
