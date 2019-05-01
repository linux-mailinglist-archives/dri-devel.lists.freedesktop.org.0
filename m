Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE5FB10CDE
	for <lists+dri-devel@lfdr.de>; Wed,  1 May 2019 20:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8C3892BE;
	Wed,  1 May 2019 18:47:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id DCAC6892C1
 for <dri-devel@lists.freedesktop.org>; Wed,  1 May 2019 18:47:21 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D90047215A; Wed,  1 May 2019 18:47:21 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109345] drm-next-2018-12-14 -Linux PPC
Date: Wed, 01 May 2019 18:47:21 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexdeucher@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109345-502-vcCCheceI1@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0706995613=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0706995613==
Content-Type: multipart/alternative; boundary="15567364413.6706cE.18829"
Content-Transfer-Encoding: 7bit


--15567364413.6706cE.18829
Date: Wed, 1 May 2019 18:47:21 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109345

--- Comment #23 from Alex Deucher <alexdeucher@gmail.com> ---
(In reply to Christian Zigotzky from comment #22)
> Again. Did you modify the behaviour of the initialisation of two graphics
> cards in the DRM updates 'drm-next-2018-12-14'? If you say no, then I can
> look in the PowerPC updates. You need to know if there was a change or you
> don't know what you published. It's not the task for the enduser to look =
in
> your code or bisect the code because you don't know the changes. It is
> always the same. You changed the code and after that we have issues and we
> endusers and first level support have to figure out where the problem is.
> And if we don't figure out the issue then the issue remains. It's easy to
> write that you don't have this platform.

No, the only changes were changes in comments, removing some unused code and
changes in the shared ttm module that touched all drivers that use ttm.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15567364413.6706cE.18829
Date: Wed, 1 May 2019 18:47:21 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345#c23">Comme=
nt # 23</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - drm-next-2018-12-14 -Linux PPC"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109345">bug 10934=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
alexdeucher&#64;gmail.com" title=3D"Alex Deucher &lt;alexdeucher&#64;gmail.=
com&gt;"> <span class=3D"fn">Alex Deucher</span></a>
</span></b>
        <pre>(In reply to Christian Zigotzky from <a href=3D"show_bug.cgi?i=
d=3D109345#c22">comment #22</a>)
<span class=3D"quote">&gt; Again. Did you modify the behaviour of the initi=
alisation of two graphics
&gt; cards in the DRM updates 'drm-next-2018-12-14'? If you say no, then I =
can
&gt; look in the PowerPC updates. You need to know if there was a change or=
 you
&gt; don't know what you published. It's not the task for the enduser to lo=
ok in
&gt; your code or bisect the code because you don't know the changes. It is
&gt; always the same. You changed the code and after that we have issues an=
d we
&gt; endusers and first level support have to figure out where the problem =
is.
&gt; And if we don't figure out the issue then the issue remains. It's easy=
 to
&gt; write that you don't have this platform.</span >

No, the only changes were changes in comments, removing some unused code and
changes in the shared ttm module that touched all drivers that use ttm.</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15567364413.6706cE.18829--

--===============0706995613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0706995613==--
