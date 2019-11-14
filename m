Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19531FCB37
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 17:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70226ED1A;
	Thu, 14 Nov 2019 16:58:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id B579E6ECF5
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 16:58:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B1F05720E2; Thu, 14 Nov 2019 16:58:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 109206] Kernel 4.20 amdgpu fails to load firmware on Ryzen 2500U
Date: Thu, 14 Nov 2019 16:58:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: luya@fedoraproject.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: FIXED
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-109206-502-z7Lv1VZ5Yo@http.bugs.freedesktop.org/>
In-Reply-To: <bug-109206-502@http.bugs.freedesktop.org/>
References: <bug-109206-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1522462221=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1522462221==
Content-Type: multipart/alternative; boundary="15737507371.d49F1.22292"
Content-Transfer-Encoding: 7bit


--15737507371.d49F1.22292
Date: Thu, 14 Nov 2019 16:58:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D109206

--- Comment #68 from Luya Tshimbalanga <luya@fedoraproject.org> ---
(In reply to Alex Deucher from comment #67)
> (In reply to Luya Tshimbalanga from comment #65)
> > Change the title reflecting the impact on Raven Ridge
>=20
> This is completely unrelated to your issue.  Please don't appropriate oth=
er
> bugs for unrelated issues.

Sorry about that.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15737507371.d49F1.22292
Date: Thu, 14 Nov 2019 16:58:57 +0000
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
   title=3D"RESOLVED FIXED - Kernel 4.20 amdgpu fails to load firmware on R=
yzen 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206#c68">Comme=
nt # 68</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED FIXED - Kernel 4.20 amdgpu fails to load firmware on R=
yzen 2500U"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D109206">bug 10920=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
luya&#64;fedoraproject.org" title=3D"Luya Tshimbalanga &lt;luya&#64;fedorap=
roject.org&gt;"> <span class=3D"fn">Luya Tshimbalanga</span></a>
</span></b>
        <pre>(In reply to Alex Deucher from <a href=3D"show_bug.cgi?id=3D10=
9206#c67">comment #67</a>)
<span class=3D"quote">&gt; (In reply to Luya Tshimbalanga from <a href=3D"s=
how_bug.cgi?id=3D109206#c65">comment #65</a>)
&gt; &gt; Change the title reflecting the impact on Raven Ridge
&gt;=20
&gt; This is completely unrelated to your issue.  Please don't appropriate =
other
&gt; bugs for unrelated issues.</span >

Sorry about that.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15737507371.d49F1.22292--

--===============1522462221==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1522462221==--
