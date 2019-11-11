Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D32E2F6F62
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2019 09:05:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62C1D6E18E;
	Mon, 11 Nov 2019 08:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 23DD56E84F
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Nov 2019 08:05:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 20BB6720E2; Mon, 11 Nov 2019 08:05:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111481] AMD Navi GPU frequent freezes on both Manjaro/Ubuntu
 with kernel 5.3 and mesa 19.2 -git/llvm9
Date: Mon, 11 Nov 2019 08:05:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: popovic.marko@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111481-502-Ei6Eh8i5pc@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1008504488=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1008504488==
Content-Type: multipart/alternative; boundary="15734595171.DEe8.11806"
Content-Transfer-Encoding: 7bit


--15734595171.DEe8.11806
Date: Mon, 11 Nov 2019 08:05:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111481

--- Comment #229 from Marko Popovic <popovic.marko@protonmail.com> ---
(In reply to Shmerl from comment #228)
> (In reply to John H from comment #227)
> >
> > specific one I can reproduce EVERY. SINGLE. TIME. was when playing Unre=
al
> > Tournament 3 via Steam proton. The "Shangri La" map i encountered locku=
ps
> > anywhere from a few seconds to a few minutes into the game. Forcing me =
to
> > hit the reset button.=20
>=20
> This could be a llvm / Mesa bug, not the kernel one. If you can reproduce
> it, please report it for that game individually to the Mesa bug tracker,
> with an apitrace.

And make sure to NOT report it for the MESA version as old as 19.2.3... only
report the bug if you're running current 19.3 RC series or 20 git series...
because a lot of those might have already been fixed.

best regards

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15734595171.DEe8.11806
Date: Mon, 11 Nov 2019 08:05:17 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481#c229">Comm=
ent # 229</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD Navi GPU frequent freezes on both Manjaro/Ubuntu with=
 kernel 5.3 and mesa 19.2 -git/llvm9"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111481">bug 11148=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
popovic.marko&#64;protonmail.com" title=3D"Marko Popovic &lt;popovic.marko&=
#64;protonmail.com&gt;"> <span class=3D"fn">Marko Popovic</span></a>
</span></b>
        <pre>(In reply to Shmerl from <a href=3D"show_bug.cgi?id=3D111481#c=
228">comment #228</a>)
<span class=3D"quote">&gt; (In reply to John H from <a href=3D"show_bug.cgi=
?id=3D111481#c227">comment #227</a>)
&gt; &gt;
&gt; &gt; specific one I can reproduce EVERY. SINGLE. TIME. was when playin=
g Unreal
&gt; &gt; Tournament 3 via Steam proton. The &quot;Shangri La&quot; map i e=
ncountered lockups
&gt; &gt; anywhere from a few seconds to a few minutes into the game. Forci=
ng me to
&gt; &gt; hit the reset button.=20
&gt;=20
&gt; This could be a llvm / Mesa bug, not the kernel one. If you can reprod=
uce
&gt; it, please report it for that game individually to the Mesa bug tracke=
r,
&gt; with an apitrace.</span >

And make sure to NOT report it for the MESA version as old as 19.2.3... only
report the bug if you're running current 19.3 RC series or 20 git series...
because a lot of those might have already been fixed.

best regards</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15734595171.DEe8.11806--

--===============1008504488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1008504488==--
