Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9A9167D7F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Feb 2020 13:29:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2FA36F43D;
	Fri, 21 Feb 2020 12:29:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5686F43D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Feb 2020 12:29:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 04:29:34 -0800
X-IronPort-AV: E=Sophos;i="5.70,468,1574150400"; d="scan'208";a="225204567"
Received: from jmiler-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.38.187])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Feb 2020 04:29:30 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Rajat Jain <rajatja@google.com>, Mark Pearson <mpearson@lenovo.com>
Subject: Re: [External] Re: [PATCH] thinkpad_acpi: Add sysfs entry for
 lcdshadow feature
In-Reply-To: <CACK8Z6GwuOnJUUscriGwKWGBp5PFKyuqUkFYC8tEXa0UEuEZww@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200220074637.7578-1-njoshi1@lenovo.com>
 <CAHp75VcJmEOu1-b7F2UAsv=Gujb=pPLzjz2ye9t4=Q68+ors-w@mail.gmail.com>
 <HK2PR0302MB25937E2946BF38583B3A905DBD130@HK2PR0302MB2593.apcprd03.prod.outlook.com>
 <CACK8Z6GwuOnJUUscriGwKWGBp5PFKyuqUkFYC8tEXa0UEuEZww@mail.gmail.com>
Date: Fri, 21 Feb 2020 14:29:35 +0200
Message-ID: <87r1yoxgwg.fsf@intel.com>
MIME-Version: 1.0
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Benjamin Berg <bberg@redhat.com>,
 Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
 Jingoo Han <jingoohan1@gmail.com>,
 Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Platform Driver <platform-driver-x86@vger.kernel.org>,
 Mat King <mathewk@google.com>, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Nitin Joshi1 <njoshi1@lenovo.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Darren Hart <dvhart@infradead.org>, Nitin Joshi <nitjoshi@gmail.com>,
 Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 20 Feb 2020, Rajat Jain <rajatja@google.com> wrote:
> Jani, I'm waiting on your inputs here
> https://lkml.org/lkml/2020/1/24/1932 in order to send the next
> iteration of my patch. Can you please let me know if you have any
> comments.

Yikes, sorry, I didn't realize you were still waiting for my input. :(

BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
