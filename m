Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E0B6D8B96
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 10:44:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 92C746E8FD;
	Wed, 16 Oct 2019 08:44:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7215F6E405
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Oct 2019 08:44:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D903D7296E; Wed, 16 Oct 2019 08:44:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112017] [CI][SHARDS]igt@kms_frontbuffer_tracking@* - fail -
 Failed assertion: drm.bufmgr
Date: Wed, 16 Oct 2019 08:44:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: chris@chris-wilson.co.uk
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112017-502-qupkQ6nwm1@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112017-502@http.bugs.freedesktop.org/>
References: <bug-112017-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1554882353=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1554882353==
Content-Type: multipart/alternative; boundary="15712154641.D0Ec.25786"
Content-Transfer-Encoding: 7bit


--15712154641.D0Ec.25786
Date: Wed, 16 Oct 2019 08:44:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112017

--- Comment #3 from Chris Wilson <chris@chris-wilson.co.uk> ---
*** Bug 112019 has been marked as a duplicate of this bug. ***

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15712154641.D0Ec.25786
Date: Wed, 16 Oct 2019 08:44:24 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][SHARDS]igt&#64;kms_frontbuffer_tracking&#=
64;* - fail - Failed assertion: drm.bufmgr"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112017#c3">Commen=
t # 3</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - [CI][SHARDS]igt&#64;kms_frontbuffer_tracking&#=
64;* - fail - Failed assertion: drm.bufmgr"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112017">bug 11201=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
chris&#64;chris-wilson.co.uk" title=3D"Chris Wilson &lt;chris&#64;chris-wil=
son.co.uk&gt;"> <span class=3D"fn">Chris Wilson</span></a>
</span></b>
        <pre>*** <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED DUPLICATE - [CI][SHARDS] igt&#64;kms_draw_crc&#64;*|ig=
t&#64;gem_double_irq_loop|igt&#64;gem_threaded_access_tiled|igt&#64;drm_imp=
ort_export&#64;import-close-race-flink - fail - Failed assertion: bufmgr"
   href=3D"show_bug.cgi?id=3D112019">Bug 112019</a> has been marked as a du=
plicate of this bug. ***</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15712154641.D0Ec.25786--

--===============1554882353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1554882353==--
