Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C584FFBD4
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 22:46:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BA436E369;
	Sun, 17 Nov 2019 21:46:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0F5516E369
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Nov 2019 21:46:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0B917720E2; Sun, 17 Nov 2019 21:46:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110795] Unable to install on latest Ubuntu (19.04)
Date: Sun, 17 Nov 2019 21:46:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: proje.pdf@outlook.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110795-502-uyflhAFngv@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110795-502@http.bugs.freedesktop.org/>
References: <bug-110795-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1341787114=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1341787114==
Content-Type: multipart/alternative; boundary="15740271800.C8F3.7793"
Content-Transfer-Encoding: 7bit


--15740271800.C8F3.7793
Date: Sun, 17 Nov 2019 21:46:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110795

--- Comment #38 from Utku Helvac=C4=B1 (tuxutku) <proje.pdf@outlook.com> ---
I made a script to only install opencl:
https://gist.github.com/tuxutku/79daa2edca131c1525a136b650cdbe0a

its basically re-implementation of opencl-amd AUR package for ubuntu

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15740271800.C8F3.7793
Date: Sun, 17 Nov 2019 21:46:20 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - Unable to install on latest Ubuntu (19.04)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795#c38">Comme=
nt # 38</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Unable to install on latest Ubuntu (19.04)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795">bug 11079=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
proje.pdf&#64;outlook.com" title=3D"Utku Helvac=C4=B1 (tuxutku) &lt;proje.p=
df&#64;outlook.com&gt;"> <span class=3D"fn">Utku Helvac=C4=B1 (tuxutku)</sp=
an></a>
</span></b>
        <pre>I made a script to only install opencl:
<a href=3D"https://gist.github.com/tuxutku/79daa2edca131c1525a136b650cdbe0a=
">https://gist.github.com/tuxutku/79daa2edca131c1525a136b650cdbe0a</a>

its basically re-implementation of opencl-amd AUR package for ubuntu</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15740271800.C8F3.7793--

--===============1341787114==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1341787114==--
