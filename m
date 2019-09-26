Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7CCBED7C
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2019 10:35:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AF9A6EE74;
	Thu, 26 Sep 2019 08:35:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id F24156ED4C
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2019 08:35:24 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id EE80D72162; Thu, 26 Sep 2019 08:35:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 102322] System crashes after "[drm] IP block:gmc_v8_0 is hung!"
 / [drm] IP block:sdma_v3_0 is hung!
Date: Thu, 26 Sep 2019 08:35:24 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: freedesktop@jeroenimo.nl
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-102322-502-AnZZ1lLuOf@http.bugs.freedesktop.org/>
In-Reply-To: <bug-102322-502@http.bugs.freedesktop.org/>
References: <bug-102322-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1456458940=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1456458940==
Content-Type: multipart/alternative; boundary="15694869245.071C709E.30895"
Content-Transfer-Encoding: 7bit


--15694869245.071C709E.30895
Date: Thu, 26 Sep 2019 08:35:24 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D102322

--- Comment #89 from jeroenimo <freedesktop@jeroenimo.nl> ---
I found a way to crash the system with glmark2
It almost instantly crashes it.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15694869245.071C709E.30895
Date: Thu, 26 Sep 2019 08:35:24 +0000
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
   title=3D"NEW - System crashes after &quot;[drm] IP block:gmc_v8_0 is hun=
g!&quot; / [drm] IP block:sdma_v3_0 is hung!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102322#c89">Comme=
nt # 89</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System crashes after &quot;[drm] IP block:gmc_v8_0 is hun=
g!&quot; / [drm] IP block:sdma_v3_0 is hung!"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D102322">bug 10232=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
freedesktop&#64;jeroenimo.nl" title=3D"jeroenimo &lt;freedesktop&#64;jeroen=
imo.nl&gt;"> <span class=3D"fn">jeroenimo</span></a>
</span></b>
        <pre>I found a way to crash the system with glmark2
It almost instantly crashes it.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15694869245.071C709E.30895--

--===============1456458940==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1456458940==--
