Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CAFE9CDA2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2019 12:54:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA5B89DE6;
	Mon, 26 Aug 2019 10:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id CAFA189DE6
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2019 10:54:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C7C9C72161; Mon, 26 Aug 2019 10:54:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111487] AMD vega - display off/on -> solid green display
Date: Mon, 26 Aug 2019 10:54:04 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: bzz@atomicbee.cz
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111487-502-REmSl7qlFj@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111487-502@http.bugs.freedesktop.org/>
References: <bug-111487-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0850809500=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0850809500==
Content-Type: multipart/alternative; boundary="15668168432.fDe81FC15.22421"
Content-Transfer-Encoding: 7bit


--15668168432.fDe81FC15.22421
Date: Mon, 26 Aug 2019 10:54:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111487

--- Comment #2 from bzz <bzz@atomicbee.cz> ---
after some time following errors appear in dmesg:

[  488.913338] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:56:crtc-0] flip_done timed out
[  970.551486] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [CRTC:56:crtc-0] flip_done timed out

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15668168432.fDe81FC15.22421
Date: Mon, 26 Aug 2019 10:54:03 +0000
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
   title=3D"NEW - AMD vega - display off/on -&gt; solid green display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111487#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMD vega - display off/on -&gt; solid green display"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111487">bug 11148=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
bzz&#64;atomicbee.cz" title=3D"bzz &lt;bzz&#64;atomicbee.cz&gt;"> <span cla=
ss=3D"fn">bzz</span></a>
</span></b>
        <pre>after some time following errors appear in dmesg:

[  488.913338] [drm:drm_atomic_helper_wait_for_flip_done [drm_kms_helper]]
*ERROR* [CRTC:56:crtc-0] flip_done timed out
[  970.551486] [drm:drm_atomic_helper_wait_for_dependencies [drm_kms_helper=
]]
*ERROR* [CRTC:56:crtc-0] flip_done timed out</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15668168432.fDe81FC15.22421--

--===============0850809500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0850809500==--
