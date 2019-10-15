Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7DFD845D
	for <lists+dri-devel@lfdr.de>; Wed, 16 Oct 2019 01:18:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C0A46E8AF;
	Tue, 15 Oct 2019 23:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id D12486E8B0
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Oct 2019 23:18:36 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id CE66B7296E; Tue, 15 Oct 2019 23:18:36 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111651] [CI][RESUME] igt@gem_ctx_shared@q-independent-bsd[12] -
 Skip - mmio base not known
Date: Tue, 15 Oct 2019 23:18:36 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: IGT
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ashutosh.dixit@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: high
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-111651-502-99yr7hAWVY@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111651-502@http.bugs.freedesktop.org/>
References: <bug-111651-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0737666117=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0737666117==
Content-Type: multipart/alternative; boundary="15711815163.3b4d.19359"
Content-Transfer-Encoding: 7bit


--15711815163.3b4d.19359
Date: Tue, 15 Oct 2019 23:18:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111651

--- Comment #4 from ashutosh.dixit@intel.com ---
Should probably start by looking at what the mmio_base values are and why b=
sd
is commented out? This will skip on all platforms for BSD engine, not just =
TGL
correct? See https://bugs.freedesktop.org/show_bug.cgi?id=3D110839.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15711815163.3b4d.19359
Date: Tue, 15 Oct 2019 23:18:36 +0000
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
   title=3D"NEW - [CI][RESUME] igt&#64;gem_ctx_shared&#64;q-independent-bsd=
[12] - Skip - mmio base not known"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111651#c4">Commen=
t # 4</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [CI][RESUME] igt&#64;gem_ctx_shared&#64;q-independent-bsd=
[12] - Skip - mmio base not known"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111651">bug 11165=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
ashutosh.dixit&#64;intel.com" title=3D"ashutosh.dixit&#64;intel.com">ashuto=
sh.dixit&#64;intel.com</a>
</span></b>
        <pre>Should probably start by looking at what the mmio_base values =
are and why bsd
is commented out? This will skip on all platforms for BSD engine, not just =
TGL
correct? See <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [CI][SHARDS] igt&#64;gem_ctx_shared&#64;q-independen=
t-bsd - skip - mmio base not known"
   href=3D"show_bug.cgi?id=3D110839">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D110839</a>.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15711815163.3b4d.19359--

--===============0737666117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0737666117==--
