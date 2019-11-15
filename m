Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97111FE72D
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 22:29:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20B06EB36;
	Fri, 15 Nov 2019 21:29:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6954B6EB37
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Nov 2019 21:29:20 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6650C720E2; Fri, 15 Nov 2019 21:29:20 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Fri, 15 Nov 2019 21:29:19 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: viste.sylvain@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-cIz7LG2f22@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0350620172=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0350620172==
Content-Type: multipart/alternative; boundary="15738533606.3Df5f8808.17316"
Content-Transfer-Encoding: 7bit


--15738533606.3Df5f8808.17316
Date: Fri, 15 Nov 2019 21:29:20 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #232 from viste.sylvain@gmail.com ---
(In reply to Sander Lienaerts from comment #231)
> Been following this thread for a while now. Can't believe this has been
> known for 3 months, without a fix released.
>=20
> Just a moment ago a random freeze occurred running Firefox and other
> applications, no games. Spotify kept playing in the background. Cursor not
> moving and unable to open another shell.
>=20
> This happened with AMD_DEBUG=3D"nongg,nodma" enabled. Running kernel 5.4r=
c7
> and Mesa 19.2.4.

I'm currently using kernel 5.4 and mesa-git (using lcarlier repo, it's writ=
ten
mesa 20 but there is no mesa 20 on the git repository so ...) on Arch and I=
'm
not having any hang or freeze so it seems to be fixed but maybe I'm lucky.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15738533606.3Df5f8808.17316
Date: Fri, 15 Nov 2019 21:29:20 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c232">Comm=
ent # 232</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
viste.sylvain&#64;gmail.com" title=3D"viste.sylvain&#64;gmail.com">viste.sy=
lvain&#64;gmail.com</a>
</span></b>
        <pre>(In reply to Sander Lienaerts from <a href=3D"show_bug.cgi?id=
=3D111481#c231">comment #231</a>)
<span class=3D"quote">&gt; Been following this thread for a while now. Can'=
t believe this has been
&gt; known for 3 months, without a fix released.
&gt;=20
&gt; Just a moment ago a random freeze occurred running Firefox and other
&gt; applications, no games. Spotify kept playing in the background. Cursor=
 not
&gt; moving and unable to open another shell.
&gt;=20
&gt; This happened with AMD_DEBUG=3D&quot;nongg,nodma&quot; enabled. Runnin=
g kernel 5.4rc7
&gt; and Mesa 19.2.4.</span >

I'm currently using kernel 5.4 and mesa-git (using lcarlier repo, it's writ=
ten
mesa 20 but there is no mesa 20 on the git repository so ...) on Arch and I=
'm
not having any hang or freeze so it seems to be fixed but maybe I'm lucky.<=
/pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15738533606.3Df5f8808.17316--

--===============0350620172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0350620172==--
