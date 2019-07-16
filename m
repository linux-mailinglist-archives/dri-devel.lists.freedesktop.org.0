Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 955F06A64F
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jul 2019 12:18:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75E1E6E112;
	Tue, 16 Jul 2019 10:18:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id F33C56E119
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jul 2019 10:18:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id F015572167; Tue, 16 Jul 2019 10:18:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 105733] Amdgpu randomly hangs and only ssh works. Mouse cursor
 moves sometimes but does nothing. Keyboard stops working.
Date: Tue, 16 Jul 2019 10:18:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: hadet@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WORKSFORME
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-105733-502-DzEmNOWzra@http.bugs.freedesktop.org/>
In-Reply-To: <bug-105733-502@http.bugs.freedesktop.org/>
References: <bug-105733-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1764325393=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1764325393==
Content-Type: multipart/alternative; boundary="156327232113.6f1b.11043"
Content-Transfer-Encoding: 7bit


--156327232113.6f1b.11043
Date: Tue, 16 Jul 2019 10:18:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D105733

--- Comment #81 from Hadet <hadet@protonmail.com> ---
Created attachment 144797
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144797&action=3Dedit
After AMDGPU crashes

Having some similar issues. After closing games running in Wine specifically

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--156327232113.6f1b.11043
Date: Tue, 16 Jul 2019 10:18:41 +0000
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
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - Amdgpu randomly hangs and only ssh works.=
 Mouse cursor moves sometimes but does nothing. Keyboard stops working."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105733#c81">Comme=
nt # 81</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WORKSFORME - Amdgpu randomly hangs and only ssh works.=
 Mouse cursor moves sometimes but does nothing. Keyboard stops working."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D105733">bug 10573=
3</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
hadet&#64;protonmail.com" title=3D"Hadet &lt;hadet&#64;protonmail.com&gt;">=
 <span class=3D"fn">Hadet</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144797=
" name=3D"attach_144797" title=3D"After AMDGPU crashes">attachment 144797</=
a> <a href=3D"attachment.cgi?id=3D144797&amp;action=3Dedit" title=3D"After =
AMDGPU crashes">[details]</a></span>
After AMDGPU crashes

Having some similar issues. After closing games running in Wine specificall=
y</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--156327232113.6f1b.11043--

--===============1764325393==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1764325393==--
