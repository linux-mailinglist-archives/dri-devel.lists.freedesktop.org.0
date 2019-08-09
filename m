Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D1FB87495
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 10:51:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AE0D6ED38;
	Fri,  9 Aug 2019 08:51:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A56A76ED3C
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 08:51:54 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A257272167; Fri,  9 Aug 2019 08:51:54 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110258] Lenovo V110-15AST AMD A9-9410  AMD R5 Stoney hangs
 after waking after suspend. 5.0 onwards
Date: Fri, 09 Aug 2019 08:51:54 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: pmw.gover@yahoo.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110258-502-52egZ8jAcO@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110258-502@http.bugs.freedesktop.org/>
References: <bug-110258-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2058994385=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2058994385==
Content-Type: multipart/alternative; boundary="15653407142.Bfe3.10977"
Content-Transfer-Encoding: 7bit


--15653407142.Bfe3.10977
Date: Fri, 9 Aug 2019 08:51:54 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110258

--- Comment #11 from Paul Gover <pmw.gover@yahoo.co.uk> ---
I got in touch with the developer.  He made a fix, I've tested it, so I pre=
sume
it will be included in the next kernel (for certain values of "next").=20
I could ask him if I could put the patch here, if people want a fix sooner.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15653407142.Bfe3.10977
Date: Fri, 9 Aug 2019 08:51:54 +0000
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
   title=3D"NEW - Lenovo V110-15AST AMD A9-9410 AMD R5 Stoney hangs after w=
aking after suspend. 5.0 onwards"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110258#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Lenovo V110-15AST AMD A9-9410 AMD R5 Stoney hangs after w=
aking after suspend. 5.0 onwards"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110258">bug 11025=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
pmw.gover&#64;yahoo.co.uk" title=3D"Paul Gover &lt;pmw.gover&#64;yahoo.co.u=
k&gt;"> <span class=3D"fn">Paul Gover</span></a>
</span></b>
        <pre>I got in touch with the developer.  He made a fix, I've tested=
 it, so I presume
it will be included in the next kernel (for certain values of &quot;next&qu=
ot;).=20
I could ask him if I could put the patch here, if people want a fix sooner.=
</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15653407142.Bfe3.10977--

--===============2058994385==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2058994385==--
