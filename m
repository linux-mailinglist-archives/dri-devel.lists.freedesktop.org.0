Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB5AC86ED
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 13:05:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561176E93A;
	Wed,  2 Oct 2019 11:05:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 99EB56E937
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 11:05:01 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 94D5372162; Wed,  2 Oct 2019 11:05:01 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111881] [kernel 5.4-rc1][amdgpu][CIK]: FW bug: No PASID in KFD
 interrupt
Date: Wed, 02 Oct 2019 11:05:01 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/amdkfd
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-111881-502-Wnwhtb4jjs@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0811812143=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0811812143==
Content-Type: multipart/alternative; boundary="15700143010.ccce.3742"
Content-Transfer-Encoding: 7bit


--15700143010.ccce.3742
Date: Wed, 2 Oct 2019 11:05:01 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111881

--- Comment #1 from erhard_f@mailbox.org ---
Created attachment 145613
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145613&action=3Dedit
kernel.config (5.4-rc1)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15700143010.ccce.3742
Date: Wed, 2 Oct 2019 11:05:01 +0000
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
   title=3D"NEW - [kernel 5.4-rc1][amdgpu][CIK]: FW bug: No PASID in KFD in=
terrupt"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111881#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [kernel 5.4-rc1][amdgpu][CIK]: FW bug: No PASID in KFD in=
terrupt"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111881">bug 11188=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
erhard_f&#64;mailbox.org" title=3D"erhard_f&#64;mailbox.org">erhard_f&#64;m=
ailbox.org</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145613=
" name=3D"attach_145613" title=3D"kernel.config (5.4-rc1)">attachment 14561=
3</a> <a href=3D"attachment.cgi?id=3D145613&amp;action=3Dedit" title=3D"ker=
nel.config (5.4-rc1)">[details]</a></span>
kernel.config (5.4-rc1)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15700143010.ccce.3742--

--===============0811812143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0811812143==--
