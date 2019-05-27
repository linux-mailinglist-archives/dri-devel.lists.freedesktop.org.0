Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AEE72B3A8
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 13:54:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ECA589949;
	Mon, 27 May 2019 11:54:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 946C489916
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 11:54:51 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9113D72167; Mon, 27 May 2019 11:54:51 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110712] [regression]Raven Ridge: System freeze but mouse cursor
 able to move when using Firefox Webrender.
Date: Mon, 27 May 2019 11:54:51 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: haxk612@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110712-502-F6rzladKW8@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110712-502@http.bugs.freedesktop.org/>
References: <bug-110712-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1138147735=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1138147735==
Content-Type: multipart/alternative; boundary="15589580910.edbAddA60.8219"
Content-Transfer-Encoding: 7bit


--15589580910.edbAddA60.8219
Date: Mon, 27 May 2019 11:54:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110712

--- Comment #2 from Haxk20 <haxk612@gmail.com> ---
Moved the bug over to mesa as this is mesa bug. Sorry for reporting it
incorrectly the first time.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15589580910.edbAddA60.8219
Date: Mon, 27 May 2019 11:54:51 +0000
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
   title=3D"NEW - [regression]Raven Ridge: System freeze but mouse cursor a=
ble to move when using Firefox Webrender."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110712#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [regression]Raven Ridge: System freeze but mouse cursor a=
ble to move when using Firefox Webrender."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110712">bug 11071=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
haxk612&#64;gmail.com" title=3D"Haxk20 &lt;haxk612&#64;gmail.com&gt;"> <spa=
n class=3D"fn">Haxk20</span></a>
</span></b>
        <pre>Moved the bug over to mesa as this is mesa bug. Sorry for repo=
rting it
incorrectly the first time.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15589580910.edbAddA60.8219--

--===============1138147735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1138147735==--
