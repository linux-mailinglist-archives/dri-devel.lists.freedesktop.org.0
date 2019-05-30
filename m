Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B853041B
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2019 23:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 390FB6E170;
	Thu, 30 May 2019 21:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A61906E177
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2019 21:25:13 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A207272167; Thu, 30 May 2019 21:25:13 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110117] Waking from Suspend causes screen to appear with grey
 static (like a TV with no signal)
Date: Thu, 30 May 2019 21:25:13 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: iakornfeld@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-110117-502-nA1b6r63Lj@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110117-502@http.bugs.freedesktop.org/>
References: <bug-110117-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1362418034=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1362418034==
Content-Type: multipart/alternative; boundary="15592515134.71A95738E.24873"
Content-Transfer-Encoding: 7bit


--15592515134.71A95738E.24873
Date: Thu, 30 May 2019 21:25:13 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110117

--- Comment #11 from leo60228 <iakornfeld@gmail.com> ---
I can reproduce on the same machine, but I get rainbow static, not grey.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15592515134.71A95738E.24873
Date: Thu, 30 May 2019 21:25:13 +0000
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
   title=3D"NEW - Waking from Suspend causes screen to appear with grey sta=
tic (like a TV with no signal)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110117#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Waking from Suspend causes screen to appear with grey sta=
tic (like a TV with no signal)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110117">bug 11011=
7</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
iakornfeld&#64;gmail.com" title=3D"leo60228 &lt;iakornfeld&#64;gmail.com&gt=
;"> <span class=3D"fn">leo60228</span></a>
</span></b>
        <pre>I can reproduce on the same machine, but I get rainbow static,=
 not grey.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15592515134.71A95738E.24873--

--===============1362418034==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1362418034==--
