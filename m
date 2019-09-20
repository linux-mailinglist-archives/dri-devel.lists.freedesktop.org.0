Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1590FB8D92
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 11:23:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89FDD6FC31;
	Fri, 20 Sep 2019 09:23:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1D2306FC31
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 09:23:52 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 1AB5772167; Fri, 20 Sep 2019 09:23:52 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111755] WARNING: CPU: 9 PID: 2908 at
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:1942
 dcn20_setup_gsl_group_as_lock+0x94/0x220 [amdgpu]
Date: Fri, 20 Sep 2019 09:23:52 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stijn+bugs@linux-ipv6.be
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111755-502-F0jHXl4uGJ@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111755-502@http.bugs.freedesktop.org/>
References: <bug-111755-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0398153495=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0398153495==
Content-Type: multipart/alternative; boundary="15689714321.95e1Ace.3319"
Content-Transfer-Encoding: 7bit


--15689714321.95e1Ace.3319
Date: Fri, 20 Sep 2019 09:23:52 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111755

--- Comment #1 from Stijn Tintel <stijn+bugs@linux-ipv6.be> ---
Created attachment 145441
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145441&action=3Dedit
basic.conf as requested on
https://amdgpu-install.readthedocs.io/en/latest/install-bugrep.html

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15689714321.95e1Ace.3319
Date: Fri, 20 Sep 2019 09:23:52 +0000
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
   title=3D"NEW - WARNING: CPU: 9 PID: 2908 at drivers/gpu/drm/amd/amdgpu/.=
./display/dc/dcn20/dcn20_hwseq.c:1942 dcn20_setup_gsl_group_as_lock+0x94/0x=
220 [amdgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111755#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - WARNING: CPU: 9 PID: 2908 at drivers/gpu/drm/amd/amdgpu/.=
./display/dc/dcn20/dcn20_hwseq.c:1942 dcn20_setup_gsl_group_as_lock+0x94/0x=
220 [amdgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111755">bug 11175=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
stijn+bugs&#64;linux-ipv6.be" title=3D"Stijn Tintel &lt;stijn+bugs&#64;linu=
x-ipv6.be&gt;"> <span class=3D"fn">Stijn Tintel</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145441=
" name=3D"attach_145441" title=3D"basic.conf as requested on https://amdgpu=
-install.readthedocs.io/en/latest/install-bugrep.html">attachment 145441</a=
> <a href=3D"attachment.cgi?id=3D145441&amp;action=3Dedit" title=3D"basic.c=
onf as requested on https://amdgpu-install.readthedocs.io/en/latest/install=
-bugrep.html">[details]</a></span>
basic.conf as requested on
<a href=3D"https://amdgpu-install.readthedocs.io/en/latest/install-bugrep.h=
tml">https://amdgpu-install.readthedocs.io/en/latest/install-bugrep.html</a=
></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15689714321.95e1Ace.3319--

--===============0398153495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0398153495==--
