Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D5F03C8F71
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2019 19:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2724F6E13A;
	Wed,  2 Oct 2019 17:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D05388A72
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2019 17:09:50 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 54C3A72162; Wed,  2 Oct 2019 17:09:50 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110926] on Centos 6.10
Date: Wed, 02 Oct 2019 17:09:50 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: Jeremy.Newton@amd.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: WONTFIX
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-110926-502-3dapxiMYPB@http.bugs.freedesktop.org/>
In-Reply-To: <bug-110926-502@http.bugs.freedesktop.org/>
References: <bug-110926-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0872934501=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0872934501==
Content-Type: multipart/alternative; boundary="15700361900.82aBBD98.20106"
Content-Transfer-Encoding: 7bit


--15700361900.82aBBD98.20106
Date: Wed, 2 Oct 2019 17:09:50 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110926

Jeremy Newton <Jeremy.Newton@amd.com> changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |WONTFIX

--- Comment #1 from Jeremy Newton <Jeremy.Newton@amd.com> ---
I'm going to close this as WONTFIX, because CentOS 6 support has been
deprecated for a while now (unsupported after 19.10).

I don't think this is going to get fixed unfortunately. I would use an older
driver or a workstation driver (I believe Q1 was the latest supporting 6.10=
)...
or update to CentOS 7/8.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15700361900.82aBBD98.20106
Date: Wed, 2 Oct 2019 17:09:50 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><span class=3D"vcard"><a class=3D"email" href=3D"mailto:Jeremy.Ne=
wton&#64;amd.com" title=3D"Jeremy Newton &lt;Jeremy.Newton&#64;amd.com&gt;"=
> <span class=3D"fn">Jeremy Newton</span></a>
</span> changed
          <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WONTFIX - on Centos 6.10"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110926">bug 11092=
6</a>
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
           <td>RESOLVED
           </td>
         </tr>

         <tr>
           <td style=3D"text-align:right;">Resolution</td>
           <td>---
           </td>
           <td>WONTFIX
           </td>
         </tr></table>
      <p>
        <div>
            <b><a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WONTFIX - on Centos 6.10"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110926#c1">Commen=
t # 1</a>
              on <a class=3D"bz_bug_link=20
          bz_status_RESOLVED  bz_closed"
   title=3D"RESOLVED WONTFIX - on Centos 6.10"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110926">bug 11092=
6</a>
              from <span class=3D"vcard"><a class=3D"email" href=3D"mailto:=
Jeremy.Newton&#64;amd.com" title=3D"Jeremy Newton &lt;Jeremy.Newton&#64;amd=
.com&gt;"> <span class=3D"fn">Jeremy Newton</span></a>
</span></b>
        <pre>I'm going to close this as WONTFIX, because CentOS 6 support h=
as been
deprecated for a while now (unsupported after 19.10).

I don't think this is going to get fixed unfortunately. I would use an older
driver or a workstation driver (I believe Q1 was the latest supporting 6.10=
)...
or update to CentOS 7/8.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15700361900.82aBBD98.20106--

--===============0872934501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0872934501==--
