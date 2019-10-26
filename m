Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8689EE59CD
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2019 13:04:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8F66EC0E;
	Sat, 26 Oct 2019 11:04:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5C33E6EC0E
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2019 11:04:14 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 54C3B720E2; Sat, 26 Oct 2019 11:04:14 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111881] [kernel 5.4-rc4][amdgpu][CIK]: FW bug: No PASID in KFD
 interrupt
Date: Sat, 26 Oct 2019 11:04:14 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/amdkfd
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111881-502-8TtWS2kbtn@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111881-502@http.bugs.freedesktop.org/>
References: <bug-111881-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1542275966=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1542275966==
Content-Type: multipart/alternative; boundary="15720878540.f253F11.7179"
Content-Transfer-Encoding: 7bit


--15720878540.f253F11.7179
Date: Sat, 26 Oct 2019 11:04:14 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111881

--- Comment #6 from erhard_f@mailbox.org ---
Created attachment 145820
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145820&action=3Dedit
rocminfo output (ROC 2.9)

Interesting is that clinfo (2.2.18.04.06) produces this hit whereas rocminfo
(ROC 2.9) gives proper output.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15720878540.f253F11.7179
Date: Sat, 26 Oct 2019 11:04:14 +0000
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
   title=3D"REOPENED - [kernel 5.4-rc4][amdgpu][CIK]: FW bug: No PASID in K=
FD interrupt"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111881#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_REOPENED "
   title=3D"REOPENED - [kernel 5.4-rc4][amdgpu][CIK]: FW bug: No PASID in K=
FD interrupt"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111881">bug 11188=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
erhard_f&#64;mailbox.org" title=3D"erhard_f&#64;mailbox.org">erhard_f&#64;m=
ailbox.org</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145820=
" name=3D"attach_145820" title=3D"rocminfo output (ROC 2.9)">attachment 145=
820</a> <a href=3D"attachment.cgi?id=3D145820&amp;action=3Dedit" title=3D"r=
ocminfo output (ROC 2.9)">[details]</a></span>
rocminfo output (ROC 2.9)

Interesting is that clinfo (2.2.18.04.06) produces this hit whereas rocminfo
(ROC 2.9) gives proper output.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15720878540.f253F11.7179--

--===============1542275966==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1542275966==--
