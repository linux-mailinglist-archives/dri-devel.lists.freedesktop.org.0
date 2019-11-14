Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0661DFCCDC
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2019 19:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DE566E3C1;
	Thu, 14 Nov 2019 18:12:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id ED77F6E3C1
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2019 18:12:11 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E4843720E2; Thu, 14 Nov 2019 18:12:11 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112266] [Navi] Pathfinder: Kingmaker is causing a GPU hang:
 flip_done timed out error
Date: Thu, 14 Nov 2019 18:12:12 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: shtetldik@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-112266-502-5JjpHLMrQ8@http.bugs.freedesktop.org/>
In-Reply-To: <bug-112266-502@http.bugs.freedesktop.org/>
References: <bug-112266-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0991025089=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0991025089==
Content-Type: multipart/alternative; boundary="15737551310.CFDd6.3869"
Content-Transfer-Encoding: 7bit


--15737551310.CFDd6.3869
Date: Thu, 14 Nov 2019 18:12:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112266

--- Comment #4 from Shmerl <shtetldik@gmail.com> ---
(In reply to Pierre-Eric Pelloux-Prayer from comment #3)
> - revert this kernel commit:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D205169#c10

Just for the reference:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D617089d5837a

Thanks, I'll give reverting it a try later today. So that fix for the infin=
ite
loop introduced a regression? Is there a better way that prevents both?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15737551310.CFDd6.3869
Date: Thu, 14 Nov 2019 18:12:11 +0000
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
   title=3D"NEW - [Navi] Pathfinder: Kingmaker is causing a GPU hang: flip_=
done timed out error"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112266#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [Navi] Pathfinder: Kingmaker is causing a GPU hang: flip_=
done timed out error"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112266">bug 11226=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
shtetldik&#64;gmail.com" title=3D"Shmerl &lt;shtetldik&#64;gmail.com&gt;"> =
<span class=3D"fn">Shmerl</span></a>
</span></b>
        <pre>(In reply to Pierre-Eric Pelloux-Prayer from <a href=3D"show_b=
ug.cgi?id=3D112266#c3">comment #3</a>)
<span class=3D"quote">&gt; - revert this kernel commit:
&gt; <a href=3D"https://bugzilla.kernel.org/show_bug.cgi?id=3D205169#c10">h=
ttps://bugzilla.kernel.org/show_bug.cgi?id=3D205169#c10</a></span >

Just for the reference:

<a href=3D"https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.g=
it/commit/?id=3D617089d5837a">https://git.kernel.org/pub/scm/linux/kernel/g=
it/torvalds/linux.git/commit/?id=3D617089d5837a</a>

Thanks, I'll give reverting it a try later today. So that fix for the infin=
ite
loop introduced a regression? Is there a better way that prevents both?</pr=
e>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15737551310.CFDd6.3869--

--===============0991025089==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0991025089==--
