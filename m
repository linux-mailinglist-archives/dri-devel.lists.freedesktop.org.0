Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A36A111EF
	for <lists+dri-devel@lfdr.de>; Thu,  2 May 2019 05:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E59489256;
	Thu,  2 May 2019 03:44:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D3FC58925A
 for <dri-devel@lists.freedesktop.org>; Thu,  2 May 2019 03:44:43 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C99B5721AA; Thu,  2 May 2019 03:44:43 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109345] drm-next-2018-12-14 -Linux PPC
Date: Thu, 02 May 2019 03:44:44 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chzigotzky@xenosoft.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109345-502-sjUWOqgPYk@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109345-502@http.bugs.freedesktop.org/>
References: <bug-109345-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0549005720=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0549005720==
Content-Type: multipart/alternative; boundary="15567686831.c7cc038B.19698"
Content-Transfer-Encoding: 7bit


--15567686831.c7cc038B.19698
Date: Thu, 2 May 2019 03:44:43 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109345

--- Comment #24 from Christian Zigotzky <chzigotzky@xenosoft.de> ---
(In reply to Alex Deucher from comment #23)
> (In reply to Christian Zigotzky from comment #22)
> > Again. Did you modify the behaviour of the initialisation of two graphi=
cs
> > cards in the DRM updates 'drm-next-2018-12-14'? If you say no, then I c=
an
> > look in the PowerPC updates. You need to know if there was a change or =
you
> > don't know what you published. It's not the task for the enduser to loo=
k in
> > your code or bisect the code because you don't know the changes. It is
> > always the same. You changed the code and after that we have issues and=
 we
> > endusers and first level support have to figure out where the problem i=
s.
> > And if we don't figure out the issue then the issue remains. It's easy =
to
> > write that you don't have this platform.
>=20
> No, the only changes were changes in comments, removing some unused code =
and
> changes in the shared ttm module that touched all drivers that use ttm.

Thank you for your reply! OK, we know that without the DRM updates 2018-12-=
14
the 2 graphics cards work together without any problems. With which good and
bad commit should I start bisecting?

@Allan
I have to compile a lot of test kernels but I can=E2=80=99t test them becau=
se I don=E2=80=99t
have these two graphics cards. Please test all test kernels.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15567686831.c7cc038B.19698
Date: Thu, 2 May 2019 03:44:43 +0000
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
   title=3D"NEW - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345#c24">Comme=
nt # 24</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345">bug 10934=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chzigotzky&#64;xenosoft.de" title=3D"Christian Zigotzky &lt;chzigotzky&#64;=
xenosoft.de&gt;"> <span class=3D"fn">Christian Zigotzky</span></a>
</span></b>
        <pre>(In reply to Alex Deucher from <a href=3D"show_bug.cgi?id=3D10=
9345#c23">comment #23</a>)
<span class=3D"quote">&gt; (In reply to Christian Zigotzky from <a href=3D"=
show_bug.cgi?id=3D109345#c22">comment #22</a>)
&gt; &gt; Again. Did you modify the behaviour of the initialisation of two =
graphics
&gt; &gt; cards in the DRM updates 'drm-next-2018-12-14'? If you say no, th=
en I can
&gt; &gt; look in the PowerPC updates. You need to know if there was a chan=
ge or you
&gt; &gt; don't know what you published. It's not the task for the enduser =
to look in
&gt; &gt; your code or bisect the code because you don't know the changes. =
It is
&gt; &gt; always the same. You changed the code and after that we have issu=
es and we
&gt; &gt; endusers and first level support have to figure out where the pro=
blem is.
&gt; &gt; And if we don't figure out the issue then the issue remains. It's=
 easy to
&gt; &gt; write that you don't have this platform.
&gt;=20
&gt; No, the only changes were changes in comments, removing some unused co=
de and
&gt; changes in the shared ttm module that touched all drivers that use ttm=
.</span >

Thank you for your reply! OK, we know that without the DRM updates 2018-12-=
14
the 2 graphics cards work together without any problems. With which good and
bad commit should I start bisecting?

&#64;Allan
I have to compile a lot of test kernels but I can=E2=80=99t test them becau=
se I don=E2=80=99t
have these two graphics cards. Please test all test kernels.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15567686831.c7cc038B.19698--

--===============0549005720==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0549005720==--
