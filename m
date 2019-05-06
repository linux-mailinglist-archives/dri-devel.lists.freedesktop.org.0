Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E271D14C00
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 16:35:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13D4C8924C;
	Mon,  6 May 2019 14:35:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C845289256
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 14:35:31 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BFA207215A; Mon,  6 May 2019 14:35:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110614] [Regression] Freeze at desktop manager startup
Date: Mon, 06 May 2019 14:35:31 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: julien.isorce@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110614-502-95HfQhvaD4@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0037517400=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0037517400==
Content-Type: multipart/alternative; boundary="15571533312.aCb8e8ab.8149"
Content-Transfer-Encoding: 7bit


--15571533312.aCb8e8ab.8149
Date: Mon, 6 May 2019 14:35:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110614

--- Comment #2 from Julien Isorce <julien.isorce@gmail.com> ---
Can you try with latest master ? Should be fixed with:
https://cgit.freedesktop.org/mesa/mesa/commit/?id=3D8cd71f399e73c5d87e9162c=
c74da76e317a9f41f
Sorry for the inconvenience

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15571533312.aCb8e8ab.8149
Date: Mon, 6 May 2019 14:35:31 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110614#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Regression] Freeze at desktop manager startup"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110614">bug 11061=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
julien.isorce&#64;gmail.com" title=3D"Julien Isorce &lt;julien.isorce&#64;g=
mail.com&gt;"> <span class=3D"fn">Julien Isorce</span></a>
</span></b>
        <pre>Can you try with latest master ? Should be fixed with:
<a href=3D"https://cgit.freedesktop.org/mesa/mesa/commit/?id=3D8cd71f399e73=
c5d87e9162cc74da76e317a9f41f">https://cgit.freedesktop.org/mesa/mesa/commit=
/?id=3D8cd71f399e73c5d87e9162cc74da76e317a9f41f</a>
Sorry for the inconvenience</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15571533312.aCb8e8ab.8149--

--===============0037517400==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0037517400==--
