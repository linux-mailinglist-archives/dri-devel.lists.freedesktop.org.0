Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCF3A7AA1
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 07:15:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973CB899B5;
	Wed,  4 Sep 2019 05:14:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 71C58899B5
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 05:14:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6E38272161; Wed,  4 Sep 2019 05:14:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111551] [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1
 timeout
Date: Wed, 04 Sep 2019 05:14:56 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: 78666679@qq.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111551-502-aF8cHmMxgn@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111551-502@http.bugs.freedesktop.org/>
References: <bug-111551-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0536380396=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0536380396==
Content-Type: multipart/alternative; boundary="15675740961.6Bf0.25462"
Content-Transfer-Encoding: 7bit


--15675740961.6Bf0.25462
Date: Wed, 4 Sep 2019 05:14:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111551

--- Comment #2 from yanhua <78666679@qq.com> ---
Created attachment 145260
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145260&action=3Dedit
The previous  dmesg.txt has  messages  been overwriten. from the dmesg-full=
.txt
can see more information

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15675740961.6Bf0.25462
Date: Wed, 4 Sep 2019 05:14:56 +0000
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
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 tim=
eout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111551#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [drm:amdgpu_job_timedout [amdgpu]] *ERROR* ring sdma1 tim=
eout"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111551">bug 11155=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
78666679&#64;qq.com" title=3D"yanhua &lt;78666679&#64;qq.com&gt;"> <span cl=
ass=3D"fn">yanhua</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145260=
" name=3D"attach_145260" title=3D"The previous  dmesg.txt has  messages  be=
en overwriten. from the dmesg-full.txt can see more information">attachment=
 145260</a> <a href=3D"attachment.cgi?id=3D145260&amp;action=3Dedit" title=
=3D"The previous  dmesg.txt has  messages  been overwriten. from the dmesg-=
full.txt can see more information">[details]</a></span>
The previous  dmesg.txt has  messages  been overwriten. from the dmesg-full=
.txt
can see more information</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15675740961.6Bf0.25462--

--===============0536380396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0536380396==--
