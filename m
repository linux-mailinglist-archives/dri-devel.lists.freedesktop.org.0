Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F3235D01
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 14:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6690F89938;
	Wed,  5 Jun 2019 12:39:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 19FEF89956
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 12:39:17 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 16DCF72167; Wed,  5 Jun 2019 12:39:17 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 105684] Loading amdgpu hits general protection fault: 0000 [#1]
 SMP NOPTI
Date: Wed, 05 Jun 2019 12:39:16 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: j.frenzel@openthinclient.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-105684-502-RGd6WPsXPR@http.bugs.freedesktop.org/>
In-Reply-To: <bug-105684-502@http.bugs.freedesktop.org/>
References: <bug-105684-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0858255116=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0858255116==
Content-Type: multipart/alternative; boundary="15597383570.941b.30448"
Content-Transfer-Encoding: 7bit


--15597383570.941b.30448
Date: Wed, 5 Jun 2019 12:39:17 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105684

--- Comment #47 from J=C3=B6rn Frenzel <j.frenzel@openthinclient.com> ---
Hi,

the problem seems to be gone in newer kernel version. I just tested a SUSE
tumbleweed with kernel 5.1.5-1 .=20

This is a satisfactory answer for me.

Regards, J=C3=B6rn

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15597383570.941b.30448
Date: Wed, 5 Jun 2019 12:39:17 +0000
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
   title=3D"REOPENED - Loading amdgpu hits general protection fault: 0000 [=
#1] SMP NOPTI"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105684#c47">Comme=
nt # 47</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - Loading amdgpu hits general protection fault: 0000 [=
#1] SMP NOPTI"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105684">bug 10568=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
j.frenzel&#64;openthinclient.com" title=3D"J=C3=B6rn Frenzel &lt;j.frenzel&=
#64;openthinclient.com&gt;"> <span class=3D"fn">J=C3=B6rn Frenzel</span></a>
</span></b>
        <pre>Hi,

the problem seems to be gone in newer kernel version. I just tested a SUSE
tumbleweed with kernel 5.1.5-1 .=20

This is a satisfactory answer for me.

Regards, J=C3=B6rn</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15597383570.941b.30448--

--===============0858255116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0858255116==--
