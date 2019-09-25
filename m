Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3CEBDDAF
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2019 14:06:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BD3289D00;
	Wed, 25 Sep 2019 12:06:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D46A989D00
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2019 12:06:03 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D0E5A72162; Wed, 25 Sep 2019 12:06:03 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111792] [AMD tahiti xt] amd-staging-drm-next broken since linux
 5.3.0-rc3 rebase
Date: Wed, 25 Sep 2019 12:06:03 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: sylvain.bertrand@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: highest
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-111792-502-Z1poK2kuzi@http.bugs.freedesktop.org/>
In-Reply-To: <bug-111792-502@http.bugs.freedesktop.org/>
References: <bug-111792-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1706111267=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1706111267==
Content-Type: multipart/alternative; boundary="15694131631.7ceF.26411"
Content-Transfer-Encoding: 7bit


--15694131631.7ceF.26411
Date: Wed, 25 Sep 2019 12:06:03 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111792

Sylvain BERTRAND <sylvain.bertrand@gmail.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #145481|0                           |1
        is obsolete|                            |

--- Comment #6 from Sylvain BERTRAND <sylvain.bertrand@gmail.com> ---
Created attachment 145511
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145511&action=3Dedit
good kernel log

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15694131631.7ceF.26411
Date: Wed, 25 Sep 2019 12:06:03 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:sylvain.b=
ertrand&#64;gmail.com" title=3D"Sylvain BERTRAND &lt;sylvain.bertrand&#64;g=
mail.com&gt;"> <span class=3D"fn">Sylvain BERTRAND</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [AMD tahiti xt] amd-staging-drm-next broken since linux 5=
.3.0-rc3 rebase"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111792">bug 11179=
2</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Attachment #145481 is obsolete</=
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
   title=3D"NEW - [AMD tahiti xt] amd-staging-drm-next broken since linux 5=
.3.0-rc3 rebase"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111792#c6">Commen=
t # 6</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - [AMD tahiti xt] amd-staging-drm-next broken since linux 5=
.3.0-rc3 rebase"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111792">bug 11179=
2</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
sylvain.bertrand&#64;gmail.com" title=3D"Sylvain BERTRAND &lt;sylvain.bertr=
and&#64;gmail.com&gt;"> <span class=3D"fn">Sylvain BERTRAND</span></a>
</span></b>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145511=
" name=3D"attach_145511" title=3D"good kernel log">attachment 145511</a> <a=
 href=3D"attachment.cgi?id=3D145511&amp;action=3Dedit" title=3D"good kernel=
 log">[details]</a></span>
good kernel log</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15694131631.7ceF.26411--

--===============1706111267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1706111267==--
