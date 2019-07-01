Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E313153BF
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 20:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF72089B9A;
	Mon,  6 May 2019 18:36:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id BE6FA89BA3
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 18:36:07 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B61407215A; Mon,  6 May 2019 18:36:07 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110614] [Regression] Freeze at desktop manager startup
Date: Mon, 06 May 2019 18:36:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: raffarti@zoho.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110614-502-v5XbJ3TRUt@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110614-502@http.bugs.freedesktop.org/>
References: <bug-110614-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1012293097=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1012293097==
Content-Type: multipart/alternative; boundary="15571677670.5F3daf2e.13225"
Content-Transfer-Encoding: 7bit


--15571677670.5F3daf2e.13225
Date: Mon, 6 May 2019 18:36:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110614

--- Comment #5 from raffarti@zoho.com ---
Maybe I should have stated so explicitely,
ec6c2297634eba77248a929048cf4201887a5f0a is the first commit to crash. It l=
ooks
like it crashes even before calling si_texture_get_handle as there's nothing
logged on bad builds. Possibly there is something wrong with my setup? I'm =
only
compiling mesa from git, all other libs are from repos.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15571677670.5F3daf2e.13225
Date: Mon, 6 May 2019 18:36:07 +0000
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
   title=3D"NEW - [Regression] Freeze at desktop manager startup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110614#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Regression] Freeze at desktop manager startup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110614">bug 11061=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
raffarti&#64;zoho.com" title=3D"raffarti&#64;zoho.com">raffarti&#64;zoho.co=
m</a>
</span></b>
        <pre>Maybe I should have stated so explicitely,
ec6c2297634eba77248a929048cf4201887a5f0a is the first commit to crash. It l=
ooks
like it crashes even before calling si_texture_get_handle as there's nothing
logged on bad builds. Possibly there is something wrong with my setup? I'm =
only
compiling mesa from git, all other libs are from repos.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15571677670.5F3daf2e.13225--

--===============1012293097==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1012293097==--
