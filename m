Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2756CB8DB0
	for <lists+dri-devel@lfdr.de>; Fri, 20 Sep 2019 11:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053866FC4F;
	Fri, 20 Sep 2019 09:26:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0128D6FC3E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Sep 2019 09:26:52 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id F209572167; Fri, 20 Sep 2019 09:26:51 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111755] WARNING: CPU: 9 PID: 2908 at
 drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_hwseq.c:1942
 dcn20_setup_gsl_group_as_lock+0x94/0x220 [amdgpu]
Date: Fri, 20 Sep 2019 09:26:52 +0000
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
Message-ID: <bug-111755-502-DvyNYa7xo2@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1090961164=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1090961164==
Content-Type: multipart/alternative; boundary="15689716110.915C554f.3894"
Content-Transfer-Encoding: 7bit


--15689716110.915C554f.3894
Date: Fri, 20 Sep 2019 09:26:51 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111755

--- Comment #7 from Stijn Tintel <stijn+bugs@linux-ipv6.be> ---
Created attachment 145447
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145447&action=3Dedit
uname -a > uname.a.log

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15689716110.915C554f.3894
Date: Fri, 20 Sep 2019 09:26:51 +0000
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
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111755#c7">Commen=
t # 7</a>
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145447=
" name=3D"attach_145447" title=3D"uname -a &gt; uname.a.log">attachment 145=
447</a> <a href=3D"attachment.cgi?id=3D145447&amp;action=3Dedit" title=3D"u=
name -a &gt; uname.a.log">[details]</a></span>
uname -a &gt; uname.a.log</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15689716110.915C554f.3894--

--===============1090961164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1090961164==--
