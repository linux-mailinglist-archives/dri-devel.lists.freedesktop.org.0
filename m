Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B74ABE30
	for <lists+dri-devel@lfdr.de>; Fri,  6 Sep 2019 19:01:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A4726E330;
	Fri,  6 Sep 2019 17:01:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id A96AF6E330
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Sep 2019 17:01:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id A65FC72161; Fri,  6 Sep 2019 17:01:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111021] [kernel >=5.2.x][amdgpu][CIK] BUG: KASAN:
 null-ptr-deref in amdgpu_ib_schedule+0x82/0x790 [amdgpu]
Date: Fri, 06 Sep 2019 17:01:03 +0000
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
Message-ID: <bug-111021-502-6iQmReT8LU@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1833773158=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1833773158==
Content-Type: multipart/alternative; boundary="15677892632.Aa3B.2552"
Content-Transfer-Encoding: 7bit


--15677892632.Aa3B.2552
Date: Fri, 6 Sep 2019 17:01:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111021

erhard_f@mailbox.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #144932|0                           |1
        is obsolete|                            |

--- Comment #8 from erhard_f@mailbox.org ---
Created attachment 145282
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145282&action=3Dedit
kernel .config (5.3-rc7)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15677892632.Aa3B.2552
Date: Fri, 6 Sep 2019 17:01:03 +0000
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
   title=3D"NEW - [kernel &gt;=3D5.2.x][amdgpu][CIK] BUG: KASAN: null-ptr-d=
eref in amdgpu_ib_schedule+0x82/0x790 [amdgpu]"
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
           <td style=3D"text-align:right;">Attachment #144932 is obsolete</=
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
   title=3D"NEW - [kernel &gt;=3D5.2.x][amdgpu][CIK] BUG: KASAN: null-ptr-d=
eref in amdgpu_ib_schedule+0x82/0x790 [amdgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111021#c8">Commen=
t # 8</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [kernel &gt;=3D5.2.x][amdgpu][CIK] BUG: KASAN: null-ptr-d=
eref in amdgpu_ib_schedule+0x82/0x790 [amdgpu]"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111021">bug 11102=
1</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
erhard_f&#64;mailbox.org" title=3D"erhard_f&#64;mailbox.org">erhard_f&#64;m=
ailbox.org</a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145282=
" name=3D"attach_145282" title=3D"kernel .config (5.3-rc7)">attachment 1452=
82</a> <a href=3D"attachment.cgi?id=3D145282&amp;action=3Dedit" title=3D"ke=
rnel .config (5.3-rc7)">[details]</a></span>
kernel .config (5.3-rc7)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15677892632.Aa3B.2552--

--===============1833773158==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1833773158==--
