Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B73A5B0786
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:14:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87C4F6EBC9;
	Thu, 12 Sep 2019 04:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0ECDA6E0E8
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2019 17:18:38 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 0617272167; Wed, 11 Sep 2019 17:18:38 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111459] AMDg black screen
Date: Wed, 11 Sep 2019 17:18:38 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: malkovjohnny@ukr.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111459-502-571en5hH1O@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111459-502@http.bugs.freedesktop.org/>
References: <bug-111459-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1130596448=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1130596448==
Content-Type: multipart/alternative; boundary="15682223170.dF895E2.26889"
Content-Transfer-Encoding: 7bit


--15682223170.dF895E2.26889
Date: Wed, 11 Sep 2019 17:18:37 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111459

--- Comment #6 from peter m <malkovjohnny@ukr.net> ---
(In reply to tajgaividra from comment #5)
> Hi,
>=20
> Have you tried reverting the xorg amdgpu package to an older version? Of
> course that is just a workaround.

only kernel driver is used


dnf list available | grep xorg-x11-drv-amdgpu
xorg-x11-drv-amdgpu.x86_64                                      19.0.1-1.fc=
30

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15682223170.dF895E2.26889
Date: Wed, 11 Sep 2019 17:18:37 +0000
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
   title=3D"NEW - AMDg black screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111459#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - AMDg black screen"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111459">bug 11145=
9</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
malkovjohnny&#64;ukr.net" title=3D"peter m &lt;malkovjohnny&#64;ukr.net&gt;=
"> <span class=3D"fn">peter m</span></a>
</span></b>
        <pre>(In reply to tajgaividra from <a href=3D"show_bug.cgi?id=3D111=
459#c5">comment #5</a>)
<span class=3D"quote">&gt; Hi,
&gt;=20
&gt; Have you tried reverting the xorg amdgpu package to an older version? =
Of
&gt; course that is just a workaround.</span >

only kernel driver is used


dnf list available | grep xorg-x11-drv-amdgpu
xorg-x11-drv-amdgpu.x86_64                                      19.0.1-1.fc=
30</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15682223170.dF895E2.26889--

--===============1130596448==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1130596448==--
