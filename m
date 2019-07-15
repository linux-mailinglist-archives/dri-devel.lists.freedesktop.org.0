Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE54A688EC
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 14:33:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F8C899F0;
	Mon, 15 Jul 2019 12:32:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id BC02C89939
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 12:32:57 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id B8CA472168; Mon, 15 Jul 2019 12:32:57 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 107694] [wine] RAGE: texture problems
Date: Mon, 15 Jul 2019 12:32:57 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: 18.2
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dmainman72@gmail.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-107694-502-sbNAKNR5TV@http.bugs.freedesktop.org/>
In-Reply-To: <bug-107694-502@http.bugs.freedesktop.org/>
References: <bug-107694-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1628731384=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1628731384==
Content-Type: multipart/alternative; boundary="15631939771.c0839ba.32088"
Content-Transfer-Encoding: 7bit


--15631939771.c0839ba.32088
Date: Mon, 15 Jul 2019 12:32:57 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D107694

--- Comment #11 from dmainman72@gmail.com ---
Seems like in Windows the problem is solved with AMD Catalyst Control Cente=
r by
turning on 'Surface Format Optimization' option.
https://steamcommunity.com/sharedfiles/filedetails/?id=3D313663882

Maybe this can give some hints on how to solve this in Linux.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15631939771.c0839ba.32088
Date: Mon, 15 Jul 2019 12:32:57 +0000
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
   title=3D"REOPENED - [wine] RAGE: texture problems"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107694#c11">Comme=
nt # 11</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [wine] RAGE: texture problems"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D107694">bug 10769=
4</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
dmainman72&#64;gmail.com" title=3D"dmainman72&#64;gmail.com">dmainman72&#64=
;gmail.com</a>
</span></b>
        <pre>Seems like in Windows the problem is solved with AMD Catalyst =
Control Center by
turning on 'Surface Format Optimization' option.
<a href=3D"https://steamcommunity.com/sharedfiles/filedetails/?id=3D3136638=
82">https://steamcommunity.com/sharedfiles/filedetails/?id=3D313663882</a>

Maybe this can give some hints on how to solve this in Linux.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15631939771.c0839ba.32088--

--===============1628731384==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1628731384==--
