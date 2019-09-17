Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9322B45A2
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2019 04:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9139E6EACC;
	Tue, 17 Sep 2019 02:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6DC366EACC
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Sep 2019 02:52:41 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6ABB272167; Tue, 17 Sep 2019 02:52:41 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 100638] Shadow of mordor crash Mesa: User error:
 GL_INVALID_VALUE in glFlushMappedBufferRange(offset 2097060 + length 480 >
 mapped length 2097152)
Date: Tue, 17 Sep 2019 02:52:41 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: Mesa
X-Bugzilla-Component: Drivers/Gallium/radeonsi
X-Bugzilla-Version: git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: t_arceri@yahoo.com.au
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-100638-502-ANsGSEENoY@http.bugs.freedesktop.org/>
In-Reply-To: <bug-100638-502@http.bugs.freedesktop.org/>
References: <bug-100638-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1652221187=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1652221187==
Content-Type: multipart/alternative; boundary="15686887611.fE475D9.5254"
Content-Transfer-Encoding: 7bit


--15686887611.fE475D9.5254
Date: Tue, 17 Sep 2019 02:52:41 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D100638

Timothy Arceri <t_arceri@yahoo.com.au> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO

--- Comment #2 from Timothy Arceri <t_arceri@yahoo.com.au> ---
Was this fixed for you with newer mesa/kernels?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15686887611.fE475D9.5254
Date: Tue, 17 Sep 2019 02:52:41 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:t_arceri&=
#64;yahoo.com.au" title=3D"Timothy Arceri &lt;t_arceri&#64;yahoo.com.au&gt;=
"> <span class=3D"fn">Timothy Arceri</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - Shadow of mordor crash Mesa: User error: GL_INVALID_=
VALUE in glFlushMappedBufferRange(offset 2097060 + length 480 &gt; mapped l=
ength 2097152)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100638">bug 10063=
8</a>
          <br>
             <table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
          <tr>
            <th>What</th>
            <th>Removed</th>
            <th>Added</th>
          </tr>

         <tr>
           <td style=3D"text-align:right;">Status</td>
           <td>NEW
           </td>
           <td>NEEDINFO
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - Shadow of mordor crash Mesa: User error: GL_INVALID_=
VALUE in glFlushMappedBufferRange(offset 2097060 + length 480 &gt; mapped l=
ength 2097152)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100638#c2">Commen=
t # 2</a>
              on <a class=3D"bz_bug_link=20
          bz_status_NEEDINFO "
   title=3D"NEEDINFO - Shadow of mordor crash Mesa: User error: GL_INVALID_=
VALUE in glFlushMappedBufferRange(offset 2097060 + length 480 &gt; mapped l=
ength 2097152)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D100638">bug 10063=
8</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
t_arceri&#64;yahoo.com.au" title=3D"Timothy Arceri &lt;t_arceri&#64;yahoo.c=
om.au&gt;"> <span class=3D"fn">Timothy Arceri</span></a>
</span></b>
        <pre>Was this fixed for you with newer mesa/kernels?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15686887611.fE475D9.5254--

--===============1652221187==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1652221187==--
