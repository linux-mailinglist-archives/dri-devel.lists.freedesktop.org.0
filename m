Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A08E8807E
	for <lists+dri-devel@lfdr.de>; Fri,  9 Aug 2019 18:50:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC9C6EE68;
	Fri,  9 Aug 2019 16:50:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8A8D86EE68
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Aug 2019 16:50:22 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 852F372167; Fri,  9 Aug 2019 16:50:22 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110457] System resumes failed and hits [drm:amdgpu_job_timedout
 [amdgpu]] *ERROR* ring gfx timeout on Acer Aspire A315-21G
Date: Fri, 09 Aug 2019 16:50:22 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: eugene@bright.gdn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110457-502-cTuw4wTAhi@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110457-502@http.bugs.freedesktop.org/>
References: <bug-110457-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1455110492=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1455110492==
Content-Type: multipart/alternative; boundary="15653694220.abfAd2.26257"
Content-Transfer-Encoding: 7bit


--15653694220.abfAd2.26257
Date: Fri, 9 Aug 2019 16:50:22 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110457

--- Comment #10 from Eugene Bright <eugene@bright.gdn> ---
The patch is on it's way
https://bugs.freedesktop.org/show_bug.cgi?id=3D110258#c12

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15653694220.abfAd2.26257
Date: Fri, 9 Aug 2019 16:50:22 +0000
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
   title=3D"NEW - System resumes failed and hits [drm:amdgpu_job_timedout [=
amdgpu]] *ERROR* ring gfx timeout on Acer Aspire A315-21G"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110457#c10">Comme=
nt # 10</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - System resumes failed and hits [drm:amdgpu_job_timedout [=
amdgpu]] *ERROR* ring gfx timeout on Acer Aspire A315-21G"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110457">bug 11045=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
eugene&#64;bright.gdn" title=3D"Eugene Bright &lt;eugene&#64;bright.gdn&gt;=
"> <span class=3D"fn">Eugene Bright</span></a>
</span></b>
        <pre>The patch is on it's way
<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Lenovo V110-15AST AMD A9-9410 AMD R5 Stoney hangs after w=
aking after suspend. 5.0 onwards"
   href=3D"show_bug.cgi?id=3D110258#c12">https://bugs.freedesktop.org/show_=
bug.cgi?id=3D110258#c12</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15653694220.abfAd2.26257--

--===============1455110492==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1455110492==--
