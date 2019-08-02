Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7C480025
	for <lists+dri-devel@lfdr.de>; Fri,  2 Aug 2019 20:26:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E666EF3C;
	Fri,  2 Aug 2019 18:26:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C8B856EF3E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Aug 2019 18:26:15 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id C54F372167; Fri,  2 Aug 2019 18:26:15 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111021] [kernel 5.2.1][amdgpu][CIK] BUG: KASAN: null-ptr-deref
 in amdgpu_ib_schedule+0x82/0x790 [amdgpu]
Date: Fri, 02 Aug 2019 18:26:15 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: erhard_f@mailbox.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-111021-502-iyw8w3Wh4g@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111021-502@http.bugs.freedesktop.org/>
References: <bug-111021-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0264742520=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0264742520==
Content-Type: multipart/alternative; boundary="15647703752.3742deaff.10230"
Content-Transfer-Encoding: 7bit


--15647703752.3742deaff.10230
Date: Fri, 2 Aug 2019 18:26:15 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111021

erhard_f@mailbox.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #144832|0                           |1
        is obsolete|                            |

--- Comment #5 from erhard_f@mailbox.org ---
Created attachment 144931
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144931&action=3Dedit
kernel dmesg (5.2.5)

More detailed debug info with KASAN.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15647703752.3742deaff.10230
Date: Fri, 2 Aug 2019 18:26:15 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:erhard_f&=
#64;mailbox.org" title=3D"erhard_f&#64;mailbox.org">erhard_f&#64;mailbox.or=
g</a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [kernel 5.2.1][amdgpu][CIK] BUG: KASAN: null-ptr-deref in=
 amdgpu_ib_schedule+0x82/0x790 [amdgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111021">bug 11102=
1</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #144832 is obsolete</=
td>
           <td>
               &nbsp;
           </td>
           <td>1
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [kernel 5.2.1][amdgpu][CIK] BUG: KASAN: null-ptr-deref in=
 amdgpu_ib_schedule+0x82/0x790 [amdgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111021#c5">Commen=
t # 5</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [kernel 5.2.1][amdgpu][CIK] BUG: KASAN: null-ptr-deref in=
 amdgpu_ib_schedule+0x82/0x790 [amdgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111021">bug 11102=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
erhard_f&#64;mailbox.org" title=3D"erhard_f&#64;mailbox.org">erhard_f&#64;m=
ailbox.org</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144931=
" name=3D"attach_144931" title=3D"kernel dmesg (5.2.5)">attachment 144931</=
a> <a href=3D"attachment.cgi?id=3D144931&amp;action=3Dedit" title=3D"kernel=
 dmesg (5.2.5)">[details]</a></span>
kernel dmesg (5.2.5)

More detailed debug info with KASAN.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15647703752.3742deaff.10230--

--===============0264742520==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0264742520==--
