Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A7AE2288
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2019 20:35:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 646386EB69;
	Wed, 23 Oct 2019 18:35:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 84A8E6EB70
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2019 18:35:07 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 81615720E2; Wed, 23 Oct 2019 18:35:07 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Wed, 23 Oct 2019 18:35:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: mail+freedesktop@benjaminneff.ch
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-briBpRORId@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0829300959=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0829300959==
Content-Type: multipart/alternative; boundary="15718557075.d6Aa.16175"
Content-Transfer-Encoding: 7bit


--15718557075.d6Aa.16175
Date: Wed, 23 Oct 2019 18:35:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #134 from Benjamin Neff <mail+freedesktop@benjaminneff.ch> ---
I had the freeze with different versions of mesa-git, but I didn't update t=
hat
since two days, I can try with the current master and see if it still freez=
es.
I don't have a way to reproduce it, it is usually random and I never had tw=
o=20
similar freezes.

I don't know if OpenGL is involved in all of my freezes, I had freezes while
watching a video on youtube in chromium, also while just browsing the web in
firefox, once it crashed during rendering file preview images of photos in
nautilus, and once it crashed while the screen was locked with i3lock. It
didn't freeze during games yet.

I have always a browser open, so it could just be a browser doing something=
 in
the background. The process mentioned in the error message is usually Xorg
itself, but once it was chrome.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15718557075.d6Aa.16175
Date: Wed, 23 Oct 2019 18:35:07 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c134">Comm=
ent # 134</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
mail+freedesktop&#64;benjaminneff.ch" title=3D"Benjamin Neff &lt;mail+freed=
esktop&#64;benjaminneff.ch&gt;"> <span class=3D"fn">Benjamin Neff</span></a>
</span></b>
        <pre>I had the freeze with different versions of mesa-git, but I di=
dn't update that
since two days, I can try with the current master and see if it still freez=
es.
I don't have a way to reproduce it, it is usually random and I never had tw=
o=20
similar freezes.

I don't know if OpenGL is involved in all of my freezes, I had freezes while
watching a video on youtube in chromium, also while just browsing the web in
firefox, once it crashed during rendering file preview images of photos in
nautilus, and once it crashed while the screen was locked with i3lock. It
didn't freeze during games yet.

I have always a browser open, so it could just be a browser doing something=
 in
the background. The process mentioned in the error message is usually Xorg
itself, but once it was chrome.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15718557075.d6Aa.16175--

--===============0829300959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0829300959==--
