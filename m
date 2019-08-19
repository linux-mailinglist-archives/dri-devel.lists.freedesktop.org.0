Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C729278F
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 16:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0304B6E191;
	Mon, 19 Aug 2019 14:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6CDD86E191
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Aug 2019 14:51:47 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 626C872161; Mon, 19 Aug 2019 14:51:47 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109607] [CI][DRMTIP] Time is passing at a different rate
 between IGT machines and the controller
Date: Mon, 19 Aug 2019 14:51:47 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cibuglog@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109607-502-dntVi0HWia@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109607-502@http.bugs.freedesktop.org/>
References: <bug-109607-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0858939881=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0858939881==
Content-Type: multipart/alternative; boundary="15662263070.8e7c97Cdd.29238"
Content-Transfer-Encoding: 7bit


--15662263070.8e7c97Cdd.29238
Date: Mon, 19 Aug 2019 14:51:47 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109607

--- Comment #15 from CI Bug Log <cibuglog@gmail.com> ---
The CI Bug Log issue associated to this bug has been updated.

### New filters associated

* shard-iclb5: igt@kms_flip@flip-vs-modeset-vs-hang-interruptible - dmesg-w=
arn
- watchdog: BUG: soft lockup - CPU#\d stuck for \d+s!
  -
https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6719/shard-iclb5/igt@kms_fl=
ip@flip-vs-modeset-vs-hang-interruptible.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15662263070.8e7c97Cdd.29238
Date: Mon, 19 Aug 2019 14:51:47 +0000
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
   title=3D"NEW - [CI][DRMTIP] Time is passing at a different rate between =
IGT machines and the controller"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109607#c15">Comme=
nt # 15</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][DRMTIP] Time is passing at a different rate between =
IGT machines and the controller"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109607">bug 10960=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
cibuglog&#64;gmail.com" title=3D"CI Bug Log &lt;cibuglog&#64;gmail.com&gt;"=
> <span class=3D"fn">CI Bug Log</span></a>
</span></b>
        <pre>The CI Bug Log issue associated to this bug has been updated.

### New filters associated

* shard-iclb5: igt&#64;kms_flip&#64;flip-vs-modeset-vs-hang-interruptible -=
 dmesg-warn
- watchdog: BUG: soft lockup - CPU#\d stuck for \d+s!
  -
<a href=3D"https://intel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6719/shard-iclb5=
/igt&#64;kms_flip&#64;flip-vs-modeset-vs-hang-interruptible.html">https://i=
ntel-gfx-ci.01.org/tree/drm-tip/CI_DRM_6719/shard-iclb5/igt&#64;kms_flip&#6=
4;flip-vs-modeset-vs-hang-interruptible.html</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15662263070.8e7c97Cdd.29238--

--===============0858939881==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0858939881==--
