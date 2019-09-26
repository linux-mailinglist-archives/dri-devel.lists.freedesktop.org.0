Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7193FBF92E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 20:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773A86EDC0;
	Thu, 26 Sep 2019 18:29:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id EE04089BAF
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 18:29:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E6BA572162; Thu, 26 Sep 2019 18:29:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110886] After S3 resume, kernel: [drm] psp command failed and
 response status is (-65529) at 27th time of S3. 28th time of S3 freeze the
 system.
Date: Thu, 26 Sep 2019 18:29:39 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kai.heng.feng@canonical.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110886-502-iY5FslCkX1@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110886-502@http.bugs.freedesktop.org/>
References: <bug-110886-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============2085256745=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============2085256745==
Content-Type: multipart/alternative; boundary="15695225780.9B6e.14603"
Content-Transfer-Encoding: 7bit


--15695225780.9B6e.14603
Date: Thu, 26 Sep 2019 18:29:38 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110886

--- Comment #20 from Kai-Heng Feng <kai.heng.feng@canonical.com> ---
(In reply to Andrey Grodzovsky from comment #19)=20
> Can you please confirm the issue happens regardless of graphic enabled, l=
oad
> system in console mode and verify you still observe the problem.

I guess you mean without graphical session? Yes I already tested that.
1. If amdgpu.ko is loaded, the issue happens under both console or graphical
session.
2. If amdgpu.ko is not loaded, the issue doesn't happen regardless of conso=
le
or graphical session.

> Does it happen also when no acceleration in system - i mean if you do S3
> cycles from console mode ?

Please refer to the point 2 above.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15695225780.9B6e.14603
Date: Thu, 26 Sep 2019 18:29:38 +0000
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
   title=3D"NEW - After S3 resume, kernel: [drm] psp command failed and res=
ponse status is (-65529) at 27th time of S3. 28th time of S3 freeze the sys=
tem."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110886#c20">Comme=
nt # 20</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - After S3 resume, kernel: [drm] psp command failed and res=
ponse status is (-65529) at 27th time of S3. 28th time of S3 freeze the sys=
tem."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110886">bug 11088=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
kai.heng.feng&#64;canonical.com" title=3D"Kai-Heng Feng &lt;kai.heng.feng&#=
64;canonical.com&gt;"> <span class=3D"fn">Kai-Heng Feng</span></a>
</span></b>
        <pre>(In reply to Andrey Grodzovsky from <a href=3D"show_bug.cgi?id=
=3D110886#c19">comment #19</a>)=20
<span class=3D"quote">&gt; Can you please confirm the issue happens regardl=
ess of graphic enabled, load
&gt; system in console mode and verify you still observe the problem.</span=
 >

I guess you mean without graphical session? Yes I already tested that.
1. If amdgpu.ko is loaded, the issue happens under both console or graphical
session.
2. If amdgpu.ko is not loaded, the issue doesn't happen regardless of conso=
le
or graphical session.

<span class=3D"quote">&gt; Does it happen also when no acceleration in syst=
em - i mean if you do S3
&gt; cycles from console mode ?</span >

Please refer to the point 2 above.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15695225780.9B6e.14603--

--===============2085256745==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============2085256745==--
