Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70C981428B3
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2020 12:02:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652D36E8CB;
	Mon, 20 Jan 2020 11:02:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F4256E8D2
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2020 11:02:21 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 03:02:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,341,1574150400"; 
 d="scan'208,217";a="426695569"
Received: from thenkel-mobl1.ger.corp.intel.com (HELO [10.252.51.186])
 ([10.252.51.186])
 by fmsmga006.fm.intel.com with ESMTP; 20 Jan 2020 03:02:19 -0800
Subject: Re: [PATCH v2] drm/syncobj: Add documentation for timeline syncobj
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20200114121928.251434-1-lionel.g.landwerlin@intel.com>
 <6b017f69-c798-40dc-aea6-ac6bcb3a49bf@amd.com>
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
Message-ID: <1c286a24-5474-fdea-9993-a2b32dfdacbb@intel.com>
Date: Mon, 20 Jan 2020 13:02:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <6b017f69-c798-40dc-aea6-ac6bcb3a49bf@amd.com>
Content-Language: en-US
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Jason Ekstrand <jason@jlekstrand.net>
Content-Type: multipart/mixed; boundary="===============0100806101=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a multi-part message in MIME format.
--===============0100806101==
Content-Type: multipart/alternative;
 boundary="------------A1F0DC9BF8BC300C4BB12540"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------A1F0DC9BF8BC300C4BB12540
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On 14/01/2020 16:25, Christian König wrote:
> Am 14.01.20 um 13:19 schrieb Lionel Landwerlin:
>> We've added a set of new APIs to manipulate syncobjs holding timelines
>> of dma_fence. This adds a bit of documentation about how this works.
>>
>> v2: Small language nits (Lionel)
>>
>> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
>> Cc: Christian Koenig <Christian.Koenig@amd.com>
>> Cc: Jason Ekstrand <jason@jlekstrand.net>
>> Cc: David(ChunMing) Zhou <David1.Zhou@amd.com>
>
> Reviewed-by: Christian König <christian.koenig@amd.com>

Thanks for the review Christian.

Feel free to merge this commit whenever, I don't think I have commit rights.


Cheers,


-Lionel


--------------A1F0DC9BF8BC300C4BB12540
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 14/01/2020 16:25, Christian König
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:6b017f69-c798-40dc-aea6-ac6bcb3a49bf@amd.com">Am
      14.01.20 um 13:19 schrieb Lionel Landwerlin:
      <br>
      <blockquote type="cite" style="color: #000000;">We've added a set
        of new APIs to manipulate syncobjs holding timelines
        <br>
        of dma_fence. This adds a bit of documentation about how this
        works.
        <br>
        <br>
        v2: Small language nits (Lionel)
        <br>
        <br>
        Signed-off-by: Lionel Landwerlin <a
          class="moz-txt-link-rfc2396E"
          href="mailto:lionel.g.landwerlin@intel.com"
          moz-do-not-send="true">&lt;lionel.g.landwerlin@intel.com&gt;</a>
        <br>
        Cc: Christian Koenig <a class="moz-txt-link-rfc2396E"
          href="mailto:Christian.Koenig@amd.com" moz-do-not-send="true">&lt;Christian.Koenig@amd.com&gt;</a>
        <br>
        Cc: Jason Ekstrand <a class="moz-txt-link-rfc2396E"
          href="mailto:jason@jlekstrand.net" moz-do-not-send="true">&lt;jason@jlekstrand.net&gt;</a>
        <br>
        Cc: David(ChunMing) Zhou <a class="moz-txt-link-rfc2396E"
          href="mailto:David1.Zhou@amd.com" moz-do-not-send="true">&lt;David1.Zhou@amd.com&gt;</a>
        <br>
      </blockquote>
      <br>
      Reviewed-by: Christian König <a class="moz-txt-link-rfc2396E"
        href="mailto:christian.koenig@amd.com" moz-do-not-send="true">&lt;christian.koenig@amd.com&gt;</a></blockquote>
    <p>Thanks for the review Christian.</p>
    <p>Feel free to merge this commit whenever, I don't think I have
      commit rights.</p>
    <p><br>
    </p>
    <p>Cheers,</p>
    <p><br>
    </p>
    <p>-Lionel<br>
    </p>
  </body>
</html>

--------------A1F0DC9BF8BC300C4BB12540--

--===============0100806101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0100806101==--
