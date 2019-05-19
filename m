Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C56E822841
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 20:15:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 331E9891D7;
	Sun, 19 May 2019 18:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id E2E07891D7
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 18:15:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DFFD672167; Sun, 19 May 2019 18:15:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 108718] Raven Ridge: ring sdma0 timeout on heavy CSS website
 with Firefox WebRender
Date: Sun, 19 May 2019 18:15:02 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: haxk612@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-108718-502-kQZBcWont8@http.bugs.freedesktop.org/>
In-Reply-To: <bug-108718-502@http.bugs.freedesktop.org/>
References: <bug-108718-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0927442719=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0927442719==
Content-Type: multipart/alternative; boundary="15582897012.f8D21.1366"
Content-Transfer-Encoding: 7bit


--15582897012.f8D21.1366
Date: Sun, 19 May 2019 18:15:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D108718

--- Comment #1 from Haxk20 <haxk612@gmail.com> ---
I have the same exact bug. As a workaround i used earlier build of mesa but
indeed the latest one is borked and unusable in Firefox.
And without webrenderer firefox is kind of unusable as the color gradient l=
ook
horrible.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15582897012.f8D21.1366
Date: Sun, 19 May 2019 18:15:01 +0000
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
   title=3D"NEW - Raven Ridge: ring sdma0 timeout on heavy CSS website with=
 Firefox WebRender"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108718#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Raven Ridge: ring sdma0 timeout on heavy CSS website with=
 Firefox WebRender"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D108718">bug 10871=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
haxk612&#64;gmail.com" title=3D"Haxk20 &lt;haxk612&#64;gmail.com&gt;"> <spa=
n class=3D"fn">Haxk20</span></a>
</span></b>
        <pre>I have the same exact bug. As a workaround i used earlier buil=
d of mesa but
indeed the latest one is borked and unusable in Firefox.
And without webrenderer firefox is kind of unusable as the color gradient l=
ook
horrible.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15582897012.f8D21.1366--

--===============0927442719==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0927442719==--
