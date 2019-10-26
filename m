Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5AC4E59B4
	for <lists+dri-devel@lfdr.de>; Sat, 26 Oct 2019 12:59:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20466EC10;
	Sat, 26 Oct 2019 10:59:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 98C566EC10
 for <dri-devel@lists.freedesktop.org>; Sat, 26 Oct 2019 10:59:09 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 953DB720E2; Sat, 26 Oct 2019 10:59:09 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111881] [kernel 5.4-rc4][amdgpu][CIK]: FW bug: No PASID in KFD
 interrupt
Date: Sat, 26 Oct 2019 10:59:09 +0000
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
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-111881-502-KJl9e3Trm3@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0276413604=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0276413604==
Content-Type: multipart/alternative; boundary="15720875491.C2bcC.5981"
Content-Transfer-Encoding: 7bit


--15720875491.C2bcC.5981
Date: Sat, 26 Oct 2019 10:59:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111881

erhard_f@mailbox.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #145612|0                           |1
        is obsolete|                            |

--- Comment #4 from erhard_f@mailbox.org ---
Created attachment 145818
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145818&action=3Dedit
dmesg (kernel 5.4-rc4)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15720875491.C2bcC.5981
Date: Sat, 26 Oct 2019 10:59:09 +0000
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
          bz_status_REOPENED "
   title=3D"REOPENED - [kernel 5.4-rc4][amdgpu][CIK]: FW bug: No PASID in K=
FD interrupt"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111881">bug 11188=
1</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #145612 is obsolete</=
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
          bz_status_REOPENED "
   title=3D"REOPENED - [kernel 5.4-rc4][amdgpu][CIK]: FW bug: No PASID in K=
FD interrupt"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111881#c4">Commen=
t # 4</a>
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145818=
" name=3D"attach_145818" title=3D"dmesg (kernel 5.4-rc4)">attachment 145818=
</a> <a href=3D"attachment.cgi?id=3D145818&amp;action=3Dedit" title=3D"dmes=
g (kernel 5.4-rc4)">[details]</a></span>
dmesg (kernel 5.4-rc4)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15720875491.C2bcC.5981--

--===============0276413604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0276413604==--
