Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E26595FD9
	for <lists+dri-devel@lfdr.de>; Tue, 20 Aug 2019 15:20:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CF076E7C0;
	Tue, 20 Aug 2019 13:20:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id E36EB6E7B5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Aug 2019 13:20:42 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DFDF772161; Tue, 20 Aug 2019 13:20:42 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110795] Unable to install on latest Ubuntu (19.04)
Date: Tue, 20 Aug 2019 13:20:42 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: etienne_lorrain@yahoo.fr
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110795-502-01UPuRv5Ny@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110795-502@http.bugs.freedesktop.org/>
References: <bug-110795-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0652866289=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0652866289==
Content-Type: multipart/alternative; boundary="15663072423.553e6A8C6.19323"
Content-Transfer-Encoding: 7bit


--15663072423.553e6A8C6.19323
Date: Tue, 20 Aug 2019 13:20:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110795

--- Comment #30 from Etienne Lorrain <etienne_lorrain@yahoo.fr> ---
(In reply to Andrew Shark from comment #29)
> Created attachment 145087 [details] [review]
> Script to modify packages to be able to use with ubuntu 19.04
>=20
> Updated script to work with Ubuntu 19.04 and driver version 19.30-855429
> Set status to REOPENED, because the problem is still actual.

Is it not fixed for you by (as my previous comment):
A shorter solution is to comment out (by adding # as first char) the line:
ModulePath "/opt/amdgpu/lib/xorg/modules"
in 00-amdgpu.conf

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15663072423.553e6A8C6.19323
Date: Tue, 20 Aug 2019 13:20:42 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - Unable to install on latest Ubuntu (19.04)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795#c30">Comme=
nt # 30</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Unable to install on latest Ubuntu (19.04)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795">bug 11079=
5</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
etienne_lorrain&#64;yahoo.fr" title=3D"Etienne Lorrain &lt;etienne_lorrain&=
#64;yahoo.fr&gt;"> <span class=3D"fn">Etienne Lorrain</span></a>
</span></b>
        <pre>(In reply to Andrew Shark from <a href=3D"show_bug.cgi?id=3D11=
0795#c29">comment #29</a>)
<span class=3D"quote">&gt; Created <span class=3D""><a href=3D"attachment.c=
gi?id=3D145087" name=3D"attach_145087" title=3D"Script to modify packages t=
o be able to use with ubuntu 19.04">attachment 145087</a> <a href=3D"attach=
ment.cgi?id=3D145087&amp;action=3Dedit" title=3D"Script to modify packages =
to be able to use with ubuntu 19.04">[details]</a></span> <a href=3D'page.c=
gi?id=3Dsplinter.html&amp;bug=3D110795&amp;attachment=3D145087'>[review]</a=
> [review]
&gt; Script to modify packages to be able to use with ubuntu 19.04
&gt;=20
&gt; Updated script to work with Ubuntu 19.04 and driver version 19.30-8554=
29
&gt; Set status to REOPENED, because the problem is still actual.</span >

Is it not fixed for you by (as my previous comment):
A shorter solution is to comment out (by adding # as first char) the line:
ModulePath &quot;/opt/amdgpu/lib/xorg/modules&quot;
in 00-amdgpu.conf</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15663072423.553e6A8C6.19323--

--===============0652866289==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0652866289==--
